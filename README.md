# Skripta pro Přednášku [Úvod do teorie kategorií](https://wiki.matfyz.cz/NMAG336) 2023/24
Aktuální verzi lze stáhnout z [actions záložky repozitáře](https://github.com/ondrachwiedziuk/Kategorie/actions).

## Lokální kompilace
Skripta jsou napsaná v [Markdownu](https://www.markdownguide.org/), následně jsou konvertována do pdf pomocí [pandoc](https://pandoc.org/).

```bash
pandoc -L /path/to/statement/statement.lua -s kategorie.md -o kategorie.pdf
```

Pro úspěšnou kompilaci je třeba mít lua filter [*statement*](https://github.com/dialoa/statement).

## Licence
Tento text je publikován pod licencí [**CC BY-NC 4.0**](https://creativecommons.org/licenses/by-nc/4.0/).

