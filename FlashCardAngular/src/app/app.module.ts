import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CommonModule } from '@angular/common';
import { HttpClientModule} from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';
import {ModalModule} from "ngx-bootstrap/modal";

import { UsuariosService } from './usuarios.service';
import { FlashCardsService } from './flash-cards.service';
import { FlashCardsComponent } from './components/flash-cards/flash-cards.component';
import { UsuarioComponent } from './components/usuario/usuario.component';
import { HomeComponent } from './components/home/home.component';

@NgModule({
  declarations: [ AppComponent, FlashCardsComponent, UsuarioComponent, HomeComponent],
  imports: [
    BrowserModule,
    AppRoutingModule,
    CommonModule,
    HttpClientModule,
    ReactiveFormsModule,
    ModalModule.forRoot()
  ],
  providers: [HttpClientModule, FlashCardsService, UsuariosService ],
  bootstrap: [AppComponent]
})
export class AppModule { }
