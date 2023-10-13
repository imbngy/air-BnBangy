import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, map } from 'rxjs';
import { Recensioni } from '../common/recensioni';

@Injectable({
  providedIn: 'root'
})
export class RecensioniService {
  

  constructor(private httpClient: HttpClient) { }

  getRecensioniByHouseId(theHouseId: number): Observable<Recensioni[]> {
    const searchUrl = `http://localhost:8080/api/recensionis/search/findByIdImmobile?id_immobile=${theHouseId}`;
    return this.httpClient.get<GetResponse>(searchUrl).pipe(
      map(response => response._embedded.recensionis)
    );

  }

  saveRecensione(recensione: Recensioni): Observable<Recensioni> {
    const saveUrl = `http://localhost:8080/recensioni/saveOrUpdate`;
    return this.httpClient.post<Recensioni>(saveUrl, recensione);
  }

  deleteRecensione(id: number) {
    const deleteUrl = `http://localhost:8080/api/recensionis/${id}`;
    return this.httpClient.delete(deleteUrl);
  }
}


interface GetResponse {
  _embedded: {
    recensionis: Recensioni[];
  }
}
