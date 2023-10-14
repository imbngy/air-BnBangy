import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { House } from "../common/house";
import { Observable } from "rxjs";
import { map } from "rxjs/operators";

@Injectable({
    providedIn: 'root'
})

export class HouseService {

  private baseUrl = 'http://localhost:8080/api/immobilis';

  constructor(private httpClient: HttpClient) { }

  getHouseList(): Observable<House[]> {
    return this.httpClient.get<GetResponse>(this.baseUrl).pipe(
      map(response => response._embedded.immobilis)
      );
  }

  getHouseById(houseId: number) {
    return this.httpClient.get<GetResponse>(`${this.baseUrl}/search/findById?id=${houseId}`).pipe(
      map(response => response._embedded.immobilis)
      );
  }

  getHouseListCategoria(categoria: string): Observable<House[]> {
    const searchUrl = `${this.baseUrl}/search/findByCategoria?categoria=${categoria}`;
    return this.returnHouses(searchUrl);
  }

  searchHousesPaginate(arg0: number, thePageSize: number, theKeyword: string): Observable<House[]> {
    const searchUrl = `${this.baseUrl}/search/findByNomeContainingIgnoreCase?nome=${theKeyword}`
                      + `&page=${arg0}&size=${thePageSize}`;
    return this.returnHouses(searchUrl);
  }

  private returnHouses(searchUrl: string): Observable<House[]> {
    return this.httpClient.get<GetResponse>(searchUrl).pipe(
      map(response => response._embedded.immobilis)
    );
  }

  saveImmobile(value: any) {
    const saveUrl = `${this.baseUrl}/save`;
    return this.httpClient.post(`${saveUrl}`, value);
  }

  getHouseListByUserId(id: number) {
    const searchUrl = `${this.baseUrl}/search/findByIdProprietario?id_proprietario=${id}`;
    return this.httpClient.get<GetResponse>(searchUrl).pipe(
      map(response => response._embedded.immobilis)
    );
  }

  deleteHouse(id: number) {
    const deleteUrl = `${this.baseUrl}/${id}`;
    return this.httpClient.delete(`${deleteUrl}`);
  }

  aggiornaPrezzo(value: number, id: number) {
    const updateUrl = `${this.baseUrl}/aggiornaPrezzo`;
    return this.httpClient.put(`${updateUrl}/${id}`, value);
  }

  updateHouse(house: House) {
    return this.httpClient.put<House>(`${this.baseUrl}/${house.id}`, house);
  }

  getHouseListFilter(filter: string): Observable<House[]> {
    if (filter == "priceAsc"){
      return this.httpClient.get<GetResponse>(`${this.baseUrl}/search/findAllByOrderByPrezzoAttualeAsc`).pipe(
        map(response => response._embedded.immobilis)
      );
    }
    else if (filter == "priceDesc"){
      return this.httpClient.get<GetResponse>(`${this.baseUrl}/search/findAllByOrderByPrezzoAttualeDesc`).pipe(
        map(response => response._embedded.immobilis)
      );
    }
    else if (filter == "metrAsc"){
      return this.httpClient.get<GetResponse>(`${this.baseUrl}/search/findAllByOrderByMetriQuadriAsc`).pipe(
        map(response => response._embedded.immobilis)
      );
    }
    else if (filter == "metrDesc"){
      return this.httpClient.get<GetResponse>(`${this.baseUrl}/search/findAllByOrderByMetriQuadriDesc`).pipe(
        map(response => response._embedded.immobilis)
      );
    }
    return this.getHouseList();
  }

}

interface GetResponse {
  _embedded: {
    immobilis: House[];
  }
}

