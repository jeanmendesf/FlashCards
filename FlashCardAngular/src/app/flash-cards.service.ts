import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { FlashCard } from './FlashCard';

const httpOptions = {
  headers: new HttpHeaders({
    'Content-type' : 'application/json'
  })
}

@Injectable({
  providedIn: 'root'
})
export class FlashCardsService {
  url = 'https://localhost:44373/api/FlashCard'
  constructor(private http: HttpClient) { }

  ObterTodosFlashCard() : Observable<FlashCard[]>{
    return this.http.get<FlashCard[]>(this.url+"/1")
  }
 
  ObterPorIdFlashCard(usuarioId:number, flashCardId:number) : Observable<FlashCard>{
    const apiUrl = `${this.url}/${usuarioId}/${flashCardId}`;
    return this.http.get<FlashCard>(apiUrl)
  }

  AdicionarFlashCard(flashCard: FlashCard) : Observable<any>{
    return this.http.post<FlashCard>(this.url+"/adicionar", flashCard, httpOptions);
  }

  AtualizarFlashCard(flashCard:FlashCard):Observable<any>{
    return this.http.put<FlashCard>(this.url+"/atualizar", flashCard, httpOptions );
  }

  DeletarFlashCard(usuarioId:number, flashCardId:number): Observable<any>{
    const apiUrl = `${this.url}/Deletar/${usuarioId}/${flashCardId}`;
    return this.http.delete<number>(apiUrl, httpOptions );
  }
}
