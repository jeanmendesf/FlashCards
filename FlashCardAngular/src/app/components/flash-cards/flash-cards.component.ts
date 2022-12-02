import { Component, OnInit, TemplateRef } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { FlashCardsService } from 'src/app/flash-cards.service';
import { FlashCard } from 'src/app/FlashCard';

@Component({
  selector: 'app-flash-cards',
  templateUrl: './flash-cards.component.html',
  styleUrls: ['./flash-cards.component.css']
})
export class FlashCardsComponent implements OnInit {  
  formulario: any;
  tituloFormulario!: string;
  
  flashCards!: FlashCard[];
  flashCardId!:number;
  flashCardResposta! : string;

  visibilidadeResposta!: string;
  respostaVisivel:boolean = false;

  visibilidadeTabela : boolean = true;
  visibilidadeFormulario : boolean = false;

  modalRef!:BsModalRef;

  constructor(private flashCardService : FlashCardsService, 
              private modalService     : BsModalService){}

  ngOnInit(): void {
    this.flashCardService.ObterTodosFlashCard().subscribe(resultado =>{
      this.flashCards = resultado;
    });
       
  }



  ExibirFormularioCadastro():void{
    this.visibilidadeTabela = false;
    this.visibilidadeFormulario = true;
    this.tituloFormulario = "Novo FlashCard";
    this.formulario = new FormGroup({
      usuarioId : new FormControl(1),
      nome      : new FormControl(null),
      pergunta  : new FormControl(null),
      resposta  : new FormControl(null)
    });
  }

  ExibirFormularioAtualizacao(flashCardId:number):void{
    this.visibilidadeTabela = false;
    this.visibilidadeFormulario = true;

    this.flashCardService.ObterPorIdFlashCard(1,flashCardId).subscribe((resultado) =>{
      this.tituloFormulario = "Atualizar FlashCard";

      this.formulario = new FormGroup({
        id        : new FormControl(resultado.id),
        usuarioId : new FormControl(1),
        nome      : new FormControl(resultado.nome),
        pergunta  : new FormControl(resultado.pergunta),
        resposta  : new FormControl(resultado.resposta)
      });
    });
  }

  Voltar():void{
    this.visibilidadeTabela = true;
    this.visibilidadeFormulario=false;
  }

  ExibirResposta(flashCardResposta:string, respostaModal: TemplateRef<any>): void{
    this.modalRef = this.modalService.show(respostaModal);
    this.flashCardResposta = flashCardResposta;    
  }

  ExibirConfirmacaoExclusao(flashCardId: number, conteudoModal: TemplateRef<any>): void{
    this.modalRef = this.modalService.show(conteudoModal);
    this.flashCardId = flashCardId;    
  }

  DeletarFlashCard(flashCardId:number){
    this.flashCardService.DeletarFlashCard(1, flashCardId).subscribe(resultado =>{
      this.modalRef.hide();
      alert('FlashCard excluido com sucesso!');
      this.flashCardService.ObterTodosFlashCard().subscribe(registros=>{
        this.flashCards= registros;
      });
    });
  }

  EnviarFormularioFlashCard(): void{
    const flashCard : FlashCard = this.formulario.value;

    if (flashCard.id > 0){
      this.flashCardService.AtualizarFlashCard(flashCard).subscribe(resultado =>{
        this.visibilidadeFormulario = false;
        this.visibilidadeTabela=true;
        alert('FlashCard atualizado com sucesso!');
        this.flashCardService.ObterTodosFlashCard().subscribe(registros=>{
          this.flashCards = registros;
        });
      })
    }else{
      this.flashCardService.AdicionarFlashCard(flashCard).subscribe((resultado)=>{
        this.visibilidadeFormulario = false;
        this.visibilidadeTabela=true;
        alert('FlashCard gravado com sucesso!');
        this.flashCardService.ObterTodosFlashCard().subscribe(registros=>{
          this.flashCards = registros;
        })
      })
  }
  }

}
