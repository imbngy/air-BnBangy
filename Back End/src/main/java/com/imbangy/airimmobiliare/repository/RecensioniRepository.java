package com.imbangy.airimmobiliare.repository;

import com.imbangy.airimmobiliare.models.Recensioni;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.data.repository.query.Param;

@CrossOrigin("http://localhost:4200")
public interface RecensioniRepository extends JpaRepository<Recensioni, Long> {

    Page<Recensioni> findAll(Pageable pageable);

    Page<Recensioni> findById(@Param("id") Long id, Pageable pageable);

    Page<Recensioni> findByIdImmobile(@Param("id_immobile") Long id_immobile, Pageable pageable);

    Page<Recensioni> findByIdUtente(@Param("id_utente") Long id_utente, Pageable pageable);

    Page<Recensioni> findByVoto(@Param("voto") int voto, Pageable pageable);




}
