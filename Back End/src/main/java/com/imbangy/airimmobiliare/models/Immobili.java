package com.imbangy.airimmobiliare.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="immobili")
public class Immobili {

    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    private String nome;

    private String descrizione;

    private String indirizzo;

    private double prezzoIniziale;

    private double prezzoAttuale;

    private String categoria;

    private double metriQuadri;

    private long idProprietario;

    private boolean venduto;

    private boolean inAsta;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "asta_id", referencedColumnName = "id")
    private Aste asta;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "utente_id", referencedColumnName = "id")
    private Utenti utente;

    @OneToMany(mappedBy = "immobile", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Recensioni> recensioni;

    @OneToMany(mappedBy = "immobile",cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Immagini> immagini;
}
