import { Component } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, ValidationErrors, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { RecensioniService } from 'src/app/services/recensioni.service';

@Component({
  selector: 'app-recensioni-create',
  templateUrl: './recensioni-create.component.html',
  styleUrls: ['./recensioni-create.component.css']
})
export class RecensioniCreateComponent {

  showRecensioneCreate: boolean = false;
  utenteId: number = 0;
  immobileId: number = 0;
  recensioneFormGroup: FormGroup;

  constructor(private recensioniService: RecensioniService,
              private route: ActivatedRoute,
              private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.recensioneFormGroup = this.formBuilder.group({
      recensione: this.formBuilder.group({
        autore: new FormControl('', [Validators.required, Validators.minLength(4), RecensioniCreateComponent.notOnlyWhitespace]),
        titolo: new FormControl('', [Validators.required, Validators.minLength(2), RecensioniCreateComponent.notOnlyWhitespace]),
        testo: new FormControl(''),
        voto: new FormControl('', [Validators.required, Validators.min(1), Validators.max(5)]),
        data: Date.now(),
        idImmobile: this.getImmobileId(),
        idUtente: this.getUtenteId()
      })
    });

  }

  getImmobileId(): number {
    this.immobileId = +this.route.snapshot.paramMap.get('id')!;
    return this.immobileId;
  }

  getUtenteId(): number {
    this.utenteId = +localStorage.getItem('id');
    return this.utenteId;
  }

  showCreate(): void {
    this.showRecensioneCreate = !this.showRecensioneCreate;
  }

  createRecensione(): void {
    if (this.recensioneFormGroup.invalid) {
      this.recensioneFormGroup.markAllAsTouched();
      return;
    }
    this.recensioniService.saveRecensione(this.recensioneFormGroup.get('recensione')!.value).subscribe(
      data => {
        console.log('Recensione salvata: ' + data);
        window.location.reload();
      }
    )
  }

  get autore() { return this.recensioneFormGroup.get('recensione.autore'); }
  get titolo() { return this.recensioneFormGroup.get('recensione.titolo'); }
  get testo() { return this.recensioneFormGroup.get('recensione.testo'); }
  get voto() { return this.recensioneFormGroup.get('recensione.voto'); }
  

  static notOnlyWhitespace(control: FormControl): ValidationErrors {
    if ((control.value != null) && (control.value.trim().length === 0)) {
      return { 'notOnlyWhitespace': true };
    } else {
      return null;
    }
  }


}
