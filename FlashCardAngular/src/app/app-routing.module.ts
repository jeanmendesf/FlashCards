import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FlashCardsComponent } from './components/flash-cards/flash-cards.component';
import { HomeComponent } from './components/home/home.component';
import { UsuarioComponent } from './components/usuario/usuario.component';

const routes: Routes = [
  {path: 'FlashCard', component: FlashCardsComponent},
  {path: 'Usuario', component:UsuarioComponent},
  {path: '', component:HomeComponent}  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
