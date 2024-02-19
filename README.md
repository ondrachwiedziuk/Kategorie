# Skripta pro Přednášku Úvod do teorie kategorií 2023/24

## Jak psár

Skripta jsou napsaná v Markdownu, následně jsou konvertována do pdf pomocí *pandoc*

```bash
pandoc -L /path/to/statement/statement.lua -s kategorie.md -o kategorie.pdf
```

Pro úspěšnou kompilaci je třeba mít lua filter *statement*

https://github.com/dialoa/statement

## TODO