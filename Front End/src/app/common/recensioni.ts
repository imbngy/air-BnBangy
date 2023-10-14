export class Recensioni {

    constructor(
        public id: number,
        public autore: string,
        public idImmobile: number,
        public idUtente: number,
        public testo: string,
        public titolo: string,
        public voto: number,
        public data: Date
    ) { }
}

