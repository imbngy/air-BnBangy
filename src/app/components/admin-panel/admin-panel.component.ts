import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Utenti } from 'src/app/common/utenti';
import { ImAuthService } from 'src/app/services/im-auth.service';
import { UtentiService } from 'src/app/services/utenti.service';

@Component({
  selector: 'app-admin-panel',
  templateUrl: './admin-panel.component.html',
  styleUrls: ['./admin-panel.component.css']
})
export class AdminPanelComponent {

  users!: Utenti[];
  utente!: Utenti;

  constructor( private utentiService: UtentiService,
               private route: ActivatedRoute,
               private imAuth: ImAuthService,
               private router: Router) { }

  ngOnInit(): void {
    if (!this.imAuth.isAdmin()) {
      this.router.navigate(['/']);
    }
    this.listUsers();
  }

  listUsers() {
    this.utentiService.getUtentiList().subscribe(
      data => {
        this.users = data;
      }
    )
  }

  banUser(id: number) {
    this.utentiService.getUtenteById(id).pipe().subscribe(
      data => {
        this.utente = data;
        console.log(this.utente.banned);
        this.utente.banned = true;
        console.log(this.utente.banned);
        this.utentiService.banUtente(id, this.utente).subscribe();
      }
    );
  }

  promoteUser(id: number) {
    this.utentiService.getUtenteById(id).pipe().subscribe(
      data => {
        this.utente = data;
        console.log(this.utente.admin);
        this.utente.admin = true;
        console.log(this.utente.admin);
        this.utentiService.banUtente(id, this.utente).subscribe();
      }
    );
  }
}
