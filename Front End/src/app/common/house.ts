import { Immagini } from "./immagini";

export class House {

    constructor(
        public id: number,
        public nome: string,
        public descrizione: string,
        public indirizzo: string,
        public prezzoIniziale: number,
        public prezzoAttuale: number,
        public categoria: string,
        public metriQuadri: number,
        public idProprietario: number,
        public venduto: boolean,
        public inAsta: boolean,
        public immagine: string

    ) { }
}
