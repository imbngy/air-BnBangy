package com.imbangy.airimmobiliare.models;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="recensioni")
public class Recensioni {

    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    private long id;

    private String titolo;

    private Short voto;

    private String autore;

    private String testo;

    private long idImmobile;

    private long idUtente;

    @CreatedDate
    @Column(name = "data", updatable = false)
    private Date data;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "immobili_id", referencedColumnName = "id")
    private Immobili immobile;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "utenti_id", referencedColumnName = "id")
    private Utenti utente;
}