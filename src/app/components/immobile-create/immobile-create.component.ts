import { Component } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, ValidationErrors, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { HouseService } from 'src/app/services/house.service';

@Component({
  selector: 'app-immobile-create',
  templateUrl: './immobile-create.component.html',
  styleUrls: ['./immobile-create.component.css']
})
export class ImmobileCreateComponent {

  utenteId: number;
  immobileId: number = 0;
  immobileFormGroup: FormGroup;

  constructor(private immobiliService: HouseService,
              private formBuilder: FormBuilder,
              private router: Router) { }

  ngOnInit(): void {
    this.immobileFormGroup = this.formBuilder.group({
      immobile: this.formBuilder.group({
        nome: new FormControl('', [Validators.required, Validators.minLength(4), ImmobileCreateComponent.notOnlyWhitespace]),
        descrizione: new FormControl('', [Validators.required, Validators.minLength(4), Validators.maxLength(255), ImmobileCreateComponent.notOnlyWhitespace]),
        prezzoIniziale: new FormControl('', [Validators.required, Validators.min(1)]),
        prezzoAttuale: 0,
        indirizzo: new FormControl('', [Validators.required, Validators.minLength(4), ImmobileCreateComponent.notOnlyWhitespace]),
        categoria: new FormControl('', [Validators.required, Validators.minLength(2), ImmobileCreateComponent.notOnlyWhitespace]),
        idProprietario: localStorage.getItem('id'),
        inAsta: [false],
        metriQuadri: new FormControl('', [Validators.required, Validators.min(1)]),
        venduto: [false]
      })
    });
  }

  static notOnlyWhitespace(control: FormControl): ValidationErrors {
    if ((control.value != null) && (control.value.trim().length === 0)) {
      return { 'notOnlyWhitespace': true };
    } else {
      return null;
    }
  }

  createImmobile(): void {
    if (this.immobileFormGroup.invalid) {
      this.immobileFormGroup.markAllAsTouched();
      return;
    }
    this.immobiliService.saveImmobile(this.immobileFormGroup.get('immobile')!.value).subscribe(
      data => {
        console.log('Immobile salvato: ' + data);
        this.router.navigate(['/aggiungiImmagini']);
      }
    );
  }

  get nome() { return this.immobileFormGroup.get('immobile.nome'); }
  get descrizione() { return this.immobileFormGroup.get('immobile.descrizione'); }
  get prezzoIniziale() { return this.immobileFormGroup.get('immobile.prezzoIniziale'); }
  get indirizzo() { return this.immobileFormGroup.get('immobile.indirizzo'); }
  get categoria() { return this.immobileFormGroup.get('immobile.categoria'); }
  get metriQuadri() { return this.immobileFormGroup.get('immobile.metriQuadri'); }

  getPrezzoIniziale(): number {
    return this.prezzoIniziale.value;
  }

}

