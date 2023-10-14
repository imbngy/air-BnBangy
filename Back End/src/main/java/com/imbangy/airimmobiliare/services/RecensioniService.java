package com.imbangy.airimmobiliare.services;

import java.util.List;
import com.imbangy.airimmobiliare.dto.RecensioniDto;

public interface RecensioniService {

    List<RecensioniDto> findAllRecensioni();

    boolean save(RecensioniDto recensioniDto);


}
