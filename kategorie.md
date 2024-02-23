---
nocite: '@*'
citeproc: true
documentclass: report
statement-kinds:
    definice:
        style: definition
        label: Definice
        counter: self
    tvrzeni:
        style: definition
        label: Tvrzení
        counter: self
    pozorovani:
        style: definition
        label: Pozorování
        counter: none
    priklad:
        style: definition
        label: Příklad
        counter: none
    lemma:
        style: definition
        label: Lemma
        counter: tvrzeni
    veta:
        style: definition
        label: Věta
        counter: tvrzeni
    pozn:
        style: remark
        label: Poznámka
        counter: none
    dk:
        style: proof
        label: Důkaz
        counter: none
---
# Úvod do teorie kategorií

\begin{center}
Přednáška 1
\end{center}

## Základní pojmy teorie kategorií

Pojem kategorie se poprvé objevil v článku "On Natural Equivalences" (1945), MacLine, Eilenberg

:::definice
Řekneme, že $K$ je *kategorie*, je-li dána třída objektů kategorie $K$, značíme $ob\:K$, přičemž pro každé $a, b \in ob\:K$ je dána množina $K(a, b)$ a vlastností $\forall a, b \in ob\: K$ $: (a,b) \neq (a',b') \implies K(a, b) \cap K(a', b') = \emptyset$.

Prvkům z $K(a,b)$ říkáme morfismy kategorie $K$ z $a$ do $b$, popř s domainem $a$ a codomainem $b$. Je-li $K$ jasná z kontextu, píšeme $\alpha: a \rightarrow b$ místo $\alpha \in K(a, b)$.

Dále budeme $mor\: K = \bigcup K(a, b)$ značit třídu všech morfismů. Navíc musí platit axiomy:

1) $\forall a, b, c \in ob\:K, \alpha \in K(a, b), \beta \in K(b, c)$ je definováno složení $\beta \alpha \in K(a, c)$.

2) $\forall a, b, c, d \in ob\:K, \alpha \in K(a ,b), \beta \in K(b, c), \gamma \in K(c, d)$ platí $\gamma(\beta\alpha) = (\gamma \beta)\alpha$. (Asociativita)

3) $\forall a \in ob\:K \exists 1_a \in K(a, a) \forall \beta, \gamma \in mor\: K: \beta 1_a = \beta \land 1_a \gamma = \gamma$, je-li složení definováno.
:::

Místo $K(a, b)$ lze také zapsat jako $Hom_K (a, b)$

Někdy se nevyžaduje, aby $K(a, b)$ byla množina. Naše definice odpovídá *lokálně malé kategorii*.

V teorii kategorií nedává smysl studovat, či vůbec uvažovat, prvky objektů dané kategorie. (Lze to ve speciálních případech, např. kategorie $Set$ množin).

:::definice
Kategorie $K$ se nazývá *malá*, pokud $mor\: K$ tvoří množinu. Ekvivalentně v naší definici $ob\:K$ tvoří množinu. Jinak nazýváme $K$ velkou.
:::

:::priklad
$Set$ je kategorie, jejíž objekty jsou množiny a morfismy jsou zobrazení se specifikovaným domainem a codomianem.

Je-li $\alpha: a \rightarrow b$ morfismus v $Set$, $b\subset c \in ob\:Set$, pak morfismus $\beta: a \rightarrow c$ definovaný vztahem $\forall x \in a: \beta(x) = \alpha(x)$ je rozdílný od $\alpha$.
:::

:::priklad
"Obstrukturované množiny"

- $Poset$ je kategorie, jejíž objekty jsou posety, morfismy monotónní zobrazení $\alpha:(a, \leq) \rightarrow (b, \leq): x \leq y \implies \alpha(x) \leq \alpha (y)$
:::

- $Graph$, $ob\: Graph$ jsou orientované grafy, morfismy jsou grafové homomorfismy.

- $Smg$, $ob\: Smg$ pologrupy, morfismy jsou homomorfismy pologrup.

- $Grp$, $ob\: Grp$ grupy, morfismy jsou homomorfismy.

- $Ab$, $ob\: Ab$ jsou abelovské grupy.

- $Top$, $ob\: Top$ topologické prostory, morfismy jsou spojitá zobrazení.

- $Haus$, $ob\: Haus$ Hausdorffovy top. prostory.

- $Ring$, $ob\: Ring$ okruhy, morfismy okruhové homomorfismy.

- $T$ je těleso, pak $Mod-T$ je kategorie, $ob\: Mod-T$ vektorové prostory, morfismy jsou $T$-lineární zobrazení.

:::priklad
Malé kategorie

- Prázdná kategorie $K$, kde $ob\: K = \emptyset$.

- Jednoobjektová kategorie $ob\: K = \{ * \}$, $K(*, *)$ je libovolný monoid s operací $\circ$ a jednotkovým prvkem $1_*$.

- Ať $(a, \leq)$ je uspořádaná množina, pak $ob\: K = a$, pro $x, y \in a$ definuji $K(x,y) = \emptyset \iff x \nleq y$, jinak $K(x,y)$ bude jednoprvková. Pak $K$ je malá kategorie. Řekli bychom, že $K$ je "uspořádaná množina".
:::

:::priklad
Obskurní příklady

- $ob\: K$ jsou body v rovině $\mathbb{R}^2$, morfismy jsou lomené čáry spojující domain a codomain.
:::

:::definice
Ať $a, b \in K$, $\alpha \in K(a,b)$. Řekneme, že $\alpha$ je

- *monomorfismus*, pokud $\forall c \in ob\: K, \beta, \gamma \in K(c, a), \beta \neq \gamma \implies \alpha \beta \neq \alpha \gamma$.

- *epimorfismus*, pokud $\forall c \in ob\: K, \beta, \gamma \in K(b, c), \beta \neq \gamma \implies \beta \alpha \neq \gamma \alpha$.

- *sekce (štěpitelný monomorfismus)*, pokud $\exists \beta \in K(b, a)$ tak, že $\beta \alpha = 1_a$.

- *retrakce (štěpitelný epimorfismus)*, pokud $\exists \beta \in K(b, a)$, že $\alpha \beta = 1_b$.

- *izomorfismus*, pokud $\exists \beta \in K(b, a)$, že $\beta \alpha = 1_a \land \alpha \beta = 1_b$.
:::

:::pozorovani
1) $\alpha$ je isomorfismus $\iff$ $\alpha$ je sekce a retrakce, $\beta$ je dáno jednoznačně, značeno $\alpha^{-1}$.
:::

___

\begin{center}
Přednáška 2
\end{center}

:::definice
Je-li $\alpha \in K(a, b)$, pak značíme $dom \alpha = a$, $codom \alpha = b$. Jsou-li $\alpha, \beta in mor K$, pak je nazveme *paralelní*, pokud $dom \alpha = dom \beta$ a $codom \alpha = codom \beta$.
:::

:::tvrzeni
Ať $K$ kategorie, pak 

1) Pro každý $a \in ob K$, pak $1_a$ je monomorfismus, epimorfismus a izomorfismus.

2) Jsou-li $\alpha, \beta$ monomorfismy a $codom \alpha = dom \beta$, pak je $\beta \alpha$ monomorfismus. Totéž pro sekce, resp. retrakce.

3) Je-li $\alpha \beta$ monomorfismus (epimorfismus), pak je $\alpha$ rovněž monomorfismus ($\beta$ epimorfismus).

4) Sekce je monomorfismus, retrakce je epimorfismus, a tedy izomorfismus je mono- i epi- morfismus, tj *bimorfismus*.
:::

:::proof
Důkaz je snadný. 4) plyne z 3) a 1).
:::

:::definice
Ať $K$ kategorie, definujeme kategorii $K^{op}$, *duální (opačná)* ke $K$, tkž. $ob K = ob K^{op}$, $\forall a, b \in ob K^{op}: K^{op}(a, b) = K(b, a)$. Složení $\alpha \beta$ v $K^{op}$ odpovídá $\alpha \beta$ v $K$.

> $K^{op}$ vznikne z K otočením orientace šipek.
:::

:::priklad
Monomorfismy (resp. sekce) v $K$ jsou právě epimorfismy (resp. retrakce) v $K^{op}$.
:::

:::priklad
1) V $Set$ monomorfismy jsou prostá zobrazení, epimorfismy jsou surjektivní zobrazení. Retrakce jsou epimorfismy, právě tehdy když platí axiom výběru. Sekce jsou monomorfismy s neprázdnou doménou a $1_\emptyset$. monomorfismus + epimorfismus = izomorfismus.

2) V $Ab$, obecněji v $Mod-R$, $R$ okruh, platí, že monomorfismy jsou prosté morfismy, epimorfismy jsou surjektivní morfismy.

3) V $Top$ jako výše.

4) V $Grp$ jako výše, ale pro epimorfismy není triviální ukázat, že jsou surjektivní.

5) $id_\mathbb{Z}: \mathbb{Z} \hookrightarrow \mathbb{Q}$ není sekce, protože $\mathbb{Q}$ je divizibilní, ale $\mathbb{Z}$ není.

6) $\mathbb{Q} \twoheadrightarrow \mathbb{Q}/ \mathbb{Z}$ není retrakce.

7) Ve 2) a 4) mono + epi = izo, ale v 3) tomu tak není.

8) $Div$ je kategorie divizibilních abelovských grup. Epimorfismy jsou surjektivní morfismy, monomorfismy jsou morfismy $\alpha$, kde $Ker \alpha$ je redukovaná grupa, tj. nemá netriviální divizibilní podgrupy. $\mathbb{Q} \twoheadrightarrow \mathbb{Q}/ \mathbb{Z}$ je monomorfismus a epimorfismus, ale není izomorfismus.

9) $TF$ je kategorie beztorzních abelovských grup. Pak epimorfismy jsou CV. ($\mathbb{Z} \hookrightarrow \mathbb{Q}$).

10) V kategorii $Haus$ jsou monomorfismy prosté morfismy. Epimorfismy jsou spojitá zobrazení na hustou část. $\mathbb{Q} \hookrightarrow \mathbb{R}$ je epimorfismus.
:::

:::definice
Kategorie se nazývá *balancovaná*, pokud "mono + epi je izo".
:::

:::definice
Buď $K$, $H$ kategorie, $F: K \rightarrow H$ se nazývá *(kovariantní) funktor*, sestává-li se z:

- $F: ob K \rightarrow ob H$ jakožto objektová část funktoru

- $\forall a, b \in K, \alpha \in K(a, b): F(\alpha) \in H(\alpha(a), \alpha(b))$. Navíc splňuje $F(1_a) = 1_{F(a)}$ a $F(\beta \alpha) = F(\beta) F(\alpha)$, je-li $\beta \alpha$ definováno v $K$.

$G: K \rightarrow H$ je *kontravariantní funktor*, pokud $G(\beta\alpha) = G(\alpha)G(\beta)$, tj. "G otáčí šipky".
:::

:::pozn
Občas se ztotožňuje kontravariantní funktor $G: K \rightarrow H$ s odpovídajícím kovariantním funktorem $K^{op} \rightarrow H$ ($K \rightarrow H^{op}$).
:::

:::priklad
1) $P^+: Set \rightarrow Set$. $\forall a \in ob K: P^+(a) = \mathcal{P}(a)$, $\alpha: a \rightarrow b: P^+(a): \mathcal{P}(a) \rightarrow \mathcal{P}(b)$, tkž $x \rightarrow \alpha[x] = \{ \alpha(p) | p \in x \} \in \mathcal{P}(b)$.


2) $P^-: Set \rightarrow Set$. $P^-(a) = P^+(a) = \mathcal{P}(a)$. $P^-(\alpha): \mathcal{P}(b) \rightarrow \mathcal{P}(a)$, tkž $y \rightarrow \{ p \in a | \alpha (p) \in y \}$.
:::

___

\begin{center}
Přednáška 3
\end{center}
