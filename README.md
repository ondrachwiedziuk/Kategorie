# Skripta pro Přednášku [Úvod do teorie kategorií](https://wiki.matfyz.cz/NMAG336) 2023/24
Aktuální verzi lze stáhnout z [actions repozitáře](https://github.com/ondrachwiedziuk/Kategorie/actions).

## Jak psát
Skripta jsou napsaná v Markdownu, následně jsou konvertována do pdf pomocí *pandoc*

```bash
pandoc -L /path/to/statement/statement.lua -s kategorie.md -o kategorie.pdf
```

Pro úspěšnou kompilaci je třeba mít lua filter [*statement*](https://github.com/dialoa/statement)

