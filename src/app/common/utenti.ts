export class Utenti {

    constructor(
        public id: number,
        public nome: string,
        public cognome: string,
        public email: string,
        public password: string,
        public telefono: number,
        public admin: boolean,
        public seller: boolean,
        public banned: boolean,
        
    ) { }
}
