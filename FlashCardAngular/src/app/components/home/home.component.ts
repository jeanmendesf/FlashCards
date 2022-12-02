import { Component, OnInit } from '@angular/core';
import { Usuario } from 'src/app/Usuario';
import { UsuariosService } from 'src/app/usuarios.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit{
  usuario!: Usuario;
  nomeUsuario!: string;
  
  constructor(private usuarioService : UsuariosService){}

  ngOnInit(): void {
    this.usuarioService.ObterPorIdUsuario(1).subscribe(resultado =>{
      this.usuario = resultado;
    });
  }

}
