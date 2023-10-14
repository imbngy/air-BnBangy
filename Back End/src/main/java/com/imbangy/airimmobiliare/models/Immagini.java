package com.imbangy.airimmobiliare.models;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="immagini")
public class Immagini {

    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    private long id;

    private String url;

    private long idAnnuncio;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "immobile", referencedColumnName = "id")
    private Immobili immobile;

}