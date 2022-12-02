import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Usuario } from './Usuario';

const httpOptions = {
  headers: new HttpHeaders({
    'Content-type' : 'application/json'
  })
}

@Injectable({
  providedIn: 'root'
})

export class UsuariosService {
  
  url = 'https://localhost:44373/api/usuario';
  constructor(private http: HttpClient) { }

  ObterPorIdUsuario(id:number) : Observable<Usuario>{
    return this.http.get<Usuario>(this.url+"/"+id)
  }

  AdicionarUsuario(usuario: Usuario) : Observable<any>{
    return this.http.post<Usuario>(this.url+"/adicionar", usuario, httpOptions);
  }

  AtualizarUsuario(usuario:Usuario):Observable<any>{
    return this.http.put<Usuario>(this.url, usuario, httpOptions );
  }

  DeletarUsuario(id:number): Observable<any>{
    const apiUrl = '${this.url}/${id}';
    return this.http.delete<number>(apiUrl, httpOptions );
  }
}
