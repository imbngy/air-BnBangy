import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Utenti } from '../common/utenti';
import { Observable, map } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class UtentiService {

  constructor(private httpClient: HttpClient) { }

  private baseUrl = 'http://localhost:8080/api/utentis';
  
  private registerUrl = 'http://localhost:8080/api/register';

  getUtentiList(): Observable<Utenti[]> {
    return this.httpClient.get<GetResponse>(this.baseUrl).pipe(
      map(response => response._embedded.utentis)
      );
  }

  saveUtente(utente: Utenti): Observable<Utenti> {
    return this.httpClient.post<Utenti>(this.registerUrl, utente);
  }

  getUtenteById(id: number): Observable<Utenti> {
    const utenteUrl = `${this.baseUrl}/search/findById?id=${id}`;
    return this.httpClient.get<GetResponse>(utenteUrl).pipe(
      map(response => response._embedded.utentis[0])
      );
  }

  getUtenteBySessionId(sessionId: String): Observable<Utenti> {
    const utenteUrl = `${this.baseUrl}/user-details?sessionId=${sessionId}`;
    return this.httpClient.get<Utenti>(utenteUrl);
  }
  
  sleep(ms: number) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  banUtente(id: number, utente: Utenti): Observable<Object> {
    const utenteUrl = `${this.baseUrl}/${id}`;
    return this.httpClient.put(utenteUrl, utente);
  }
  
}

interface GetResponse{
  _embedded: {
    utentis: Utenti[];
  }
}

