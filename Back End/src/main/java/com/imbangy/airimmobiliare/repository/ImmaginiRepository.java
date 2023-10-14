package com.imbangy.airimmobiliare.repository;

import com.imbangy.airimmobiliare.models.Immagini;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin("http://localhost:4200")
public interface ImmaginiRepository extends JpaRepository<Immagini, Long> {

    Page<Immagini> findAll(Pageable pageable);

    Page<Immagini> findById(@Param("id")Long id, Pageable pageable);

    Page<Immagini> findByIdAnnuncio(@Param("id_annuncio")Long id_annuncio, Pageable pageable);

}
