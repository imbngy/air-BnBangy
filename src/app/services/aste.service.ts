import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, map } from 'rxjs';
import { Aste } from '../common/aste';

@Injectable({
  providedIn: 'root'
})
export class AsteService {
  

  private baseUrl = 'http://localhost:8080/api/astes';

  constructor(private httpClient: HttpClient) { }

  getAstebyIdAnnuncio(idAnnuncio: number): Observable<Aste[]> {
    return this.httpClient.get<GetResponse>(`${this.baseUrl}/search/findByIdAnnuncio?idAnnuncio=${idAnnuncio}`).pipe(
      map(response => response._embedded.astes)
      );
  }

  getAsteList(): Observable<Aste[]> {
    return this.httpClient.get<GetResponse>(this.baseUrl).pipe(
      map(response => response._embedded.astes)
      );
  }

  updateAsta(asta: Aste) {
    return this.httpClient.put<Aste>(`${this.baseUrl}/${asta.id}`, asta);
  }

  createAsta(asta: Aste) {
    const saveUrl = `http://localhost:8080/aste/create`;
    return this.httpClient.post<Aste>(saveUrl, asta);
  }

}

interface GetResponse {
  _embedded: {
    astes: Aste[];
  }
}
