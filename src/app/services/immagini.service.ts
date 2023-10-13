import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Immagini } from '../common/immagini';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment.development';

@Injectable({
  providedIn: 'root'
})
export class ImmaginiService {

  private baseUrl = 'http://localhost:8080/api/immaginis';

  constructor(private httpClient: HttpClient) { }

  getImmaginiByHouseId(houseId: number): Observable<Immagini[]> {
    const searchUrl = `${this.baseUrl}/search/findByIdAnnuncio?id_annuncio=${houseId}`;
    return this.httpClient.get<GetResponse>(searchUrl).pipe(
      map(response => response._embedded.immaginis)
    );
  }

  uploadimgbb(file: File): Observable<string> {
    const formData = new FormData();
    formData.append('image', file);
    return this.httpClient.post("https://api.imgbb.com/1/upload?key=2694f32caf2b0b13398f8501b2eb3eea", formData).pipe(
      map(response => response['data'].url)
    );
  }

  addImmagini(immagini: Immagini): Observable<Immagini> {
    const saveUrl = `${this.baseUrl}/save`;
    return this.httpClient.post<Immagini>(saveUrl, immagini);
  }

  getImmagineByHouseId(id: number) {
    const searchUrl = `${this.baseUrl}/search/findByIdAnnuncio?id_annuncio=${id}`;
    return this.httpClient.get<GetResponse>(searchUrl).pipe(
      map(response => response._embedded.immaginis[0])
    );
  }
}

interface GetResponse {
  _embedded: {
    immaginis: Immagini[];
  }
}