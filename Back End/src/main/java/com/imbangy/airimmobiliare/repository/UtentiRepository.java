package com.imbangy.airimmobiliare.repository;

import com.imbangy.airimmobiliare.models.Utenti;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin("http://localhost:4200")
public interface UtentiRepository extends JpaRepository<Utenti, Long>{

    Page<Utenti> findAll(Pageable pageable);

    Page<Utenti> findByNomeContaining(@Param("nome")String nome, Pageable pageable);

    Page<Utenti> findByCognomeContaining(@Param("cognome")String cognome, Pageable pageable);

    Page<Utenti> findByEmailContainingIgnoreCase(@Param("email")String email, Pageable pageable);

    Page<Utenti> findById(@Param("id")Long id, Pageable pageable);

    Page<Utenti> findByNome(@Param("nome")String nome, Pageable pageable);

    Page<Utenti> findByCognome(@Param("cognome")String cognome, Pageable pageable);

    Utenti findByEmailIgnoreCase(@Param("email")String email);

    Page<Utenti> findBySeller(@Param("seller")boolean seller, Pageable pageable);

    Page<Utenti> findByAdmin(@Param("admin")boolean admin, Pageable pageable);

    Page<Utenti> findByBanned(@Param("banned")boolean banned, Pageable pageable);

    Page<Utenti> findByTelefono(@Param("telefono")Long telefono, Pageable pageable);




}
