package com.imbangy.airimmobiliare.repository;


import com.imbangy.airimmobiliare.models.Aste;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.data.domain.Pageable;

@CrossOrigin("http://localhost:4200")
public interface AsteRepository extends JpaRepository<Aste, Long> {

    Page<Aste> findAll(Pageable pageable);

    Page<Aste> findByCompratore(@Param("compratore") String compratore, Pageable pageable);

    Page<Aste> findByIdAnnuncio(@Param("idAnnuncio") Long idAnnuncio, Pageable pageable);

    Page<Aste> findById(@Param("id") Long id, Pageable pageable);

    Page<Aste> findByPrezzoInizialeGreaterThan(@Param("prezzo_iniziale") double prezzo_iniziale, Pageable pageable);

    Page<Aste> findByPrezzoInizialeLessThanEqual(@Param("prezzo_iniziale") double prezzo_iniziale, Pageable pageable);

    Page<Aste> findByPrezzoAttualeGreaterThan(@Param("prezzo_attuale") double prezzo_attuale, Pageable pageable);

    Page<Aste> findByPrezzoAttualeLessThanEqual(@Param("prezzo_attuale") double prezzo_attuale, Pageable pageable);


}
