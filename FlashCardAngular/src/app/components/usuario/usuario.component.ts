import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import {Usuario} from 'src/app/Usuario';
import { UsuariosService } from 'src/app/usuarios.service';

@Component({
  selector: 'app-usuario',
  templateUrl: './usuario.component.html',
  styleUrls: ['./usuario.component.css']
})

export class UsuarioComponent implements OnInit {
  
  formulario: any;
  tituloFormulario!: string;
  usuario!: Usuario;
  
  constructor(private usuarioService: UsuariosService){}

  ngOnInit(): void {
    this.tituloFormulario = "Novo usuário";
    this.formulario =  new FormGroup({
      Id             : new FormControl(0),
      UsuarioLogin   : new FormControl(null),
      Senha          : new FormControl(null),
      Nome           : new FormControl(null),
      Sobrenome      : new FormControl(null),
      DataNascimento : new FormControl(null),
      DataCadastro   : new FormControl('2000-01-01')
    });
  }

  EnviarFormularioUsuario(): void{
    const usuario : Usuario = this.formulario.value;
    this.usuarioService.AdicionarUsuario(usuario).subscribe((resultado) =>{
      alert('Pessoa inserida com sucesso');
    });
  }
}

