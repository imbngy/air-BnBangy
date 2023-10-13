import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Utenti } from '../common/utenti';
import { UtentiService } from './utenti.service';
import { ActivatedRoute, Router } from "@angular/router";
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ImAuthService {
  sessionId: string | null | undefined;
  utenteCorrente: Utenti;
  isLoggedIn: Boolean = false;
  admin: Boolean = false;

  constructor(private httpClient: HttpClient,
    public route: ActivatedRoute,
    private utentiService: UtentiService,
    private router: Router) { this.checkLogin(); }

  ngOnInit(): void {

  }

  checkLogin() {

    if (this.utenteCorrente != null) return true;
    this.sleep(100).then(() => {
      this.sessionId = this.route.snapshot.queryParams['sessionId'];
      console.log("sessionId: " + this.sessionId);
      this.utentiService.getUtenteBySessionId(this.sessionId).subscribe({
        next: (data) => {
          console.log("[!] SessionID valid, user found!");
          this.utenteCorrente = data;
          this.isLoggedIn = true;

          localStorage.setItem("nome", this.utenteCorrente.nome);
          localStorage.setItem("cognome", this.utenteCorrente.cognome);
          localStorage.setItem("telefono", this.utenteCorrente.telefono.toString());
          localStorage.setItem("email", this.utenteCorrente.email);
          localStorage.setItem("password", this.utenteCorrente.password);
          localStorage.setItem("bannato", this.utenteCorrente.banned.toString());
          localStorage.setItem("id", this.utenteCorrente.id.toString());
          localStorage.setItem("admin", this.utenteCorrente.admin.toString());
          localStorage.setItem("seller", this.utenteCorrente.seller.toString());
          return true;

        },

        error: (err) => {
          const dataInLocalStorage = localStorage.getItem("nome");
          if (dataInLocalStorage == null || dataInLocalStorage == undefined) {
            console.log("[!] SessionID invalid, user not found!" + err);
            this.isLoggedIn = false;
            this.utenteCorrente = null;
            return false;
          }
          this.isLoggedIn = true;
          this.utenteCorrente.nome = localStorage.getItem("nome");
          this.utenteCorrente.cognome = localStorage.getItem("cognome");
          this.utenteCorrente.telefono = parseInt(localStorage.getItem("telefono"));
          this.utenteCorrente.email = localStorage.getItem("email");
          this.utenteCorrente.password = localStorage.getItem("password");
          this.utenteCorrente.banned = JSON.parse(localStorage.getItem("bannato"));
          this.utenteCorrente.id = parseInt(localStorage.getItem("id"));
          this.utenteCorrente.admin = JSON.parse(localStorage.getItem("admin"));
          this.utenteCorrente.seller = JSON.parse(localStorage.getItem("seller"));
          return true;
        },
      });
    });
    return false;
  }


  //get session id from backend
  getSessionId(): Observable<string> {
    return this.httpClient.get<string>("http://localhost:8080/api/session-id");
  }

  isAdmin() {
    if (this.utenteCorrente == null) { return false; }
    return this.utenteCorrente.admin;
  }

  isSeller() {
    if (this.utenteCorrente == null) return false;
    return this.utenteCorrente.seller;
  }

  logout(): void {
    this.utenteCorrente = null;
    this.isLoggedIn = false;
    this.sessionId = null;
    localStorage.clear();
    this.router.navigate(["/houses"]);
  }

  sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
}
