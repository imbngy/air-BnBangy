package com.imbangy.airimmobiliare.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="aste")
public class Aste {

    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    private long id;

    private long idAnnuncio;

    private String compratore;

    private int prezzoIniziale;

    private int prezzoAttuale;

    @OneToOne(mappedBy = "asta")
    private Immobili immobile;
}