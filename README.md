# Skripta pro Přednášku [Úvod do teorie kategorií](https://wiki.matfyz.cz/NMAG336) 2023/24
Aktuální verzi lze stáhnout z [actions záložky repozitáře](https://github.com/ondrachwiedziuk/Kategorie/actions).

## Lokální kompilace
Skripta jsou napsaná v [Markdownu](https://www.markdownguide.org/), následně jsou konvertována do pdf pomocí [pandoc](https://pandoc.org/).
Pro úspěšnou kompilaci je třeba mít lua filter [*statement*](https://github.com/dialoa/statement).

**Instalace závislostí**  
```bash
make install
```

**Kompilace pdf**  
```bash
make
```
(defaultuje na `make build`)

## Licence
Tento text je publikován pod licencí [**CC BY-NC 4.0**](https://creativecommons.org/licenses/by-nc/4.0/).

