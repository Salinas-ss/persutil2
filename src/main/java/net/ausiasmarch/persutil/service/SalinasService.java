package net.ausiasmarch.persutil.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import net.ausiasmarch.persutil.entity.SalinasEntity;
import net.ausiasmarch.persutil.repository.SalinasRepository;

@Service
public class SalinasService {
  
    // INYECCIÓN DE DEPENDENCIA DEBE IR AL INICIO
    @Autowired
    SalinasRepository oSalinasRepository;
    
    // ----------------------------BULK CREATE---------------------------------
    public Long bulkCreate(Long amount) {
        String[] nombres = {"Paella de marisco", "Tortilla de patatas", "Gazpacho andaluz", "Fideuá", "Tarta de queso casera", "Lentejas de la abuela"};
        String[] ingredientes = {"Arroz, gambas, calamar, pollo", "Patatas, huevos, cebolla, aceite", "Tomate, pepino, pimiento, pan", "Fideos, caldo de pescado, marisco", "Queso crema, huevos, nata, base de galleta", "Lentejas, chorizo, verduras"};
        String[] preparaciones = {
            "Cocer el arroz con el caldo y el marisco durante 20 minutos a fuego medio.",
            "Freír las patatas y la cebolla, mezclarlas con el huevo batido y cuajar la tortilla.",
            "Triturar todos los vegetales con agua, aceite, vinagre y sal. Enfriar bien.",
            "Sofreír el marisco, añadir los fideos y el caldo caliente, dejando reducir.",
            "Mezclar el queso, huevos y nata. Hornear sobre la base de galleta a 180ºC por 40 minutos.",
            "Cocer las lentejas con el chorizo y las verduras hasta que estén tiernas."
        }; 
        for (long i = 0; i < amount; i++) {
            SalinasEntity receta = new SalinasEntity();
            
            receta.setNombre(nombres[(int)(Math.random() * nombres.length)] + " " + i);
            receta.setIngredientes(ingredientes[(int)(Math.random() * ingredientes.length)]);
            receta.setPreparacion(preparaciones[(int)(Math.random() * preparaciones.length)]); 
            
            receta.setFechaCreacion(LocalDateTime.now());
            receta.setFechaModificacion(null);      
            oSalinasRepository.save(receta);
        }
        return oSalinasRepository.count();
    }
  
    // ----------------------------CRUD---------------------------------
    public SalinasEntity get(Long id) {
        return oSalinasRepository.findById(id).orElseThrow(() -> new RuntimeException("Blog not found"));
    }

    public Long create(SalinasEntity salinasEntity) {
        salinasEntity.setFechaCreacion(LocalDateTime.now());
        salinasEntity.setFechaModificacion(null);
        oSalinasRepository.save(salinasEntity);
        return salinasEntity.getId();
    }

    public Long update(SalinasEntity salinasEntity) {
        SalinasEntity existingSalinas = oSalinasRepository.findById(salinasEntity.getId())
                .orElseThrow(() -> new RuntimeException("Salinas not found"));
        existingSalinas.setNombre(salinasEntity.getNombre());
        existingSalinas.setIngredientes(salinasEntity.getIngredientes());
        existingSalinas.setPreparacion(salinasEntity.getPreparacion());
        existingSalinas.setFechaModificacion(LocalDateTime.now());
        oSalinasRepository.save(existingSalinas);
        return existingSalinas.getId();
    }

    public Long delete(Long id) {
        oSalinasRepository.deleteById(id);
        return id;
    }

    public Page<SalinasEntity> getPage(Pageable oPageable) {
        return oSalinasRepository.findAll(oPageable);
    }

    public Long count() {
        return oSalinasRepository.count();
    }
}
