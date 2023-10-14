package com.imbangy.airimmobiliare.models;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="utenti")
public class Utenti {

    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    private long id;

    private String nome;

    private String cognome;

    private String email;

    private String password;

    private Long telefono;

    private boolean admin;

    private boolean seller;

    private boolean banned;

    @OneToOne(mappedBy = "utente")
    private Immobili immobili;

    @OneToMany(mappedBy = "utente", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Recensioni> recensioni = new ArrayList<Recensioni>();

    public Utenti(String nome, String cognome, String email, String password, Long telefono, boolean admin, boolean seller, boolean banned) {
        this.nome = nome;
        this.cognome = cognome;
        this.email = email;
        this.password = password;
        this.telefono = telefono;
        this.admin = admin;
        this.seller = seller;
        this.banned = banned;
    }

}