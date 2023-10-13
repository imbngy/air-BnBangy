import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, ValidationErrors, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { Utenti } from 'src/app/common/utenti';
import { UtentiService } from 'src/app/services/utenti.service';


@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent {

  registerFormGroup!: FormGroup;
  utenti: Utenti[] = [];
  

  constructor(private utentiService: UtentiService,
    private formBuilder: FormBuilder,
    private cookie: CookieService) { }

  ngOnInit(): void {

    this.registerFormGroup = this.formBuilder.group({
      utente: this.formBuilder.group({
        nome: new FormControl('', [Validators.required, Validators.minLength(2), RegisterComponent.notOnlyWhitespace]),
        cognome: new FormControl('', [Validators.required, Validators.minLength(2), RegisterComponent.notOnlyWhitespace]),
        email: new FormControl('',
          [Validators.required,
          Validators.pattern('^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$')]
        ),
        password: new FormControl('', [Validators.required, Validators.minLength(8), RegisterComponent.notOnlyWhitespace]),
        telefono: new FormControl('', [Validators.required, Validators.minLength(10)]),
        seller: [false],
        admin: [false],
        banned: [false]
      })
    });

    
  }

  register() {
    console.log(this.registerFormGroup.get('utente')!.value);
    if (this.registerFormGroup.invalid) {
      this.registerFormGroup.markAllAsTouched();
      return;
    }
    this.utentiService.saveUtente(this.registerFormGroup.get('utente')!.value).subscribe(
      data => {
        console.log('Utente salvato: ' + data);
        // this.cookie.set('utente', JSON.stringify(data));
        window.location.href = "/houses";
      }
    )
  }

  get nome() { return this.registerFormGroup.get('utente.nome'); }
  get cognome() { return this.registerFormGroup.get('utente.cognome'); }
  get email() { return this.registerFormGroup.get('utente.email'); }
  get password() { return this.registerFormGroup.get('utente.password'); }
  get telefono() { return this.registerFormGroup.get('utente.telefono'); }
  get seller() { return this.registerFormGroup.get('utente.seller'); }
  get admin() { return this.registerFormGroup.get('utente.admin'); }
  get banned() { return this.registerFormGroup.get('utente.banned'); }


  static notOnlyWhitespace(control: FormControl): ValidationErrors {
    if ((control.value != null) && (control.value.trim().length === 0)) {
      return { 'notOnlyWhitespace': true };
    } else {
      return null;
    }
  }
}
