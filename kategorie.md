---
nocite: '@*'
citeproc: true
documentclass: report
header-includes:
  - \newcommand{\K}{\mathcal{K}}
  - \newcommand{\ob}{\text{ob\,}}
  - \newcommand{\mor}{\text{mor\,}}
  - \newcommand{\Ker}{\text{Ker\,}}
  - \newcommand{\dom}{\text{dom\,}}
  - \newcommand{\codom}{\text{codom\,}}
  - \newcommand{\Hom}{\text{Hom\,}}
  - \newcommand{\cat}[1]{\mathtt{#1}}
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
Řekneme, že $\K$ je *kategorie*, je-li dána třída objektů kategorie $\K$, značíme $\ob \K$, přičemž pro každé $a, b \in \ob \K$ je dána množina $\K(a, b)$ a vlastností $\forall a, b \in \ob \K$ $: (a,b) \neq (a',b') \implies \K(a, b) \cap \K(a', b') = \emptyset$.

Prvkům z $\K(a,b)$ říkáme morfismy kategorie $\K$ z $a$ do $b$, popř s domainem $a$ a codomainem $b$. Je-li $\K$ jasná z kontextu, píšeme $\alpha: a \rightarrow b$ místo $\alpha \in \K(a, b)$.

Dále budeme $\mor \K = \bigcup \K(a, b)$ značit třídu všech morfismů. Navíc musí platit axiomy:

1) $\forall a, b, c \in \ob \K, \alpha \in \K(a, b), \beta \in \K(b, c)$ je definováno složení $\beta \circ \alpha \in \K(a, c)$.

2) $\forall a, b, c, d \in \ob \K, \alpha \in \K(a ,b), \beta \in \K(b, c), \gamma \in \K(c, d)$ platí $\gamma \circ (\beta \circ \alpha) = (\gamma \circ \beta)\circ \alpha$. (Asociativita)

3) $\forall a \in \ob \K \exists 1_a \in \K(a, a) \forall \beta, \gamma \in \mor \K: \beta \circ 1_a = \beta \land 1_a \circ \gamma = \gamma$, je-li složení definováno.
:::

Místo $\K(a, b)$ lze také zapsat jako $\Hom_{\K} (a, b)$

Někdy se nevyžaduje, aby $\K(a, b)$ byla množina. Naše definice odpovídá *lokálně malé kategorii*.

V teorii kategorií nedává smysl studovat, či vůbec uvažovat, prvky objektů dané kategorie. (Lze to ve speciálních případech, např. kategorie $\cat{Set}$ množin).

:::definice
Kategorie $\K$ se nazývá *malá*, pokud $\mor \K$ tvoří množinu. Ekvivalentně v naší definici $\ob \K$ tvoří množinu. Jinak nazýváme $\K$ velkou.
:::

:::priklad
$\cat{Set}$ je kategorie, jejíž objekty jsou množiny a morfismy jsou zobrazení se specifikovaným domainem a codomianem.

Je-li $\alpha: a \rightarrow b$ morfismus v $\cat{Set}$, $b\subset c \in \ob \cat{Set}$, pak morfismus $\beta: a \rightarrow c$ definovaný vztahem $\forall x \in a: \beta(x) = \alpha(x)$ je rozdílný od $\alpha$.
:::

:::priklad
"Obstrukturované množiny"

- $\cat{Poset}$ je kategorie, jejíž objekty jsou posety, morfismy monotónní zobrazení $\alpha:(a, \leq) \rightarrow (b, \leq): x \leq y \implies \alpha(x) \leq \alpha (y)$
:::

- $\cat{Graph}$, $\ob \cat{Graph}$ jsou orientované grafy, morfismy jsou grafové homomorfismy.

- $\cat{Smg}$, $\ob \cat{Smg}$ pologrupy, morfismy jsou homomorfismy pologrup.

- $\cat{Grp}$, $\ob \cat{Grp}$ grupy, morfismy jsou homomorfismy.

- $\cat{Ab}$, $\ob \cat{Ab}$ jsou abelovské grupy.

- $\cat{Top}$, $\ob \cat{Top}$ topologické prostory, morfismy jsou spojitá zobrazení.

- $\cat{Haus}$, $\ob \cat{Haus}$ Hausdorffovy top. prostory.

- $\cat{Ring}$, $\ob \cat{Ring}$ okruhy, morfismy okruhové homomorfismy.

- $T$ je těleso, pak $\cat{Mod-T}$ je kategorie, $\ob \cat{Mod-T}$ vektorové prostory, morfismy jsou $T$-lineární zobrazení.

:::priklad
Malé kategorie

- Prázdná kategorie $\K$, kde $\ob \K = \emptyset$.

- Jednoobjektová kategorie $\ob \K = \{ * \}$, $\K(*, *)$ je libovolný monoid s operací $\circ$ a jednotkovým prvkem $1_*$.

- Ať $(a, \leq)$ je uspořádaná množina, pak $\ob \K = a$, pro $x, y \in a$ definuji $\K(x,y) = \emptyset \iff x \nleq y$, jinak $\K(x,y)$ bude jednoprvková. Pak $\K$ je malá kategorie. Řekli bychom, že $\K$ je "uspořádaná množina".
:::

:::priklad
Obskurní příklady

- $\ob \K$ jsou body v rovině $\mathbb{R}^2$, morfismy jsou lomené čáry spojující domain a codomain.
:::

:::definice
Ať $a, b \in \K$, $\alpha \in \K(a,b)$. Řekneme, že $\alpha$ je

- *monomorfismus*, pokud $\forall c \in \ob \K, \beta, \gamma \in \K(c, a), \beta \neq \gamma \implies \alpha \circ \beta \neq \alpha \circ \gamma$.

- *epimorfismus*, pokud $\forall c \in \ob \K, \beta, \gamma \in K(b, c), \beta \neq \gamma \implies \beta \circ \alpha \neq \gamma \circ \alpha$.

- *sekce (štěpitelný monomorfismus)*, pokud $\exists \beta \in \K(b, a)$ tak, že $\beta \circ \alpha = 1_a$.

- *retrakce (štěpitelný epimorfismus)*, pokud $\exists \beta \in \K(b, a)$, že $\alpha \circ \beta = 1_b$.

- *izomorfismus*, pokud $\exists \beta \in \K(b, a)$, že $\beta \circ \alpha = 1_a \land \alpha \circ \beta = 1_b$.
:::

:::pozorovani
1) $\alpha$ je isomorfismus $\iff$ $\alpha$ je sekce a retrakce, $\beta$ je dáno jednoznačně, značeno $\alpha^{-1}$.
:::

___

\begin{center}
Přednáška 2
\end{center}

:::definice
Je-li $\alpha \in \K(a, b)$, pak značíme $\dom \alpha = a$, $\codom \alpha = b$. Jsou-li $\alpha, \beta \in \mor \K$, pak je nazveme *paralelní*, pokud $\dom \alpha = \dom \beta$ a $\codom \alpha = \codom \beta$.
:::

:::tvrzeni
Ať $\K$ kategorie, pak

1) Pro každý $a \in \ob \K$, pak $1_a$ je monomorfismus, epimorfismus a izomorfismus.

2) Jsou-li $\alpha, \beta$ monomorfismy a $\codom \alpha = \dom \beta$, pak je $\beta \alpha$ monomorfismus. Totéž pro sekce, resp. retrakce.

3) Je-li $\alpha \circ \beta$ monomorfismus (epimorfismus), pak je $\alpha$ rovněž monomorfismus ($\beta$ epimorfismus).

4) Sekce je monomorfismus, retrakce je epimorfismus, a tedy izomorfismus je mono- i epi- morfismus, tj *bimorfismus*.
:::

:::proof
Důkaz je snadný. 4) plyne z 3) a 1).
:::

:::definice
Ať $\K$ kategorie, definujeme kategorii $\K^{op}$, *duální (opačná)* ke $K$, tkž. $\ob K = \ob \K^{op}$, $\forall a, b \in \ob \K^{op}: K^{op}(a, b) = \K(b, a)$. Složení $\alpha \circ \beta$ v $K^{op}$ odpovídá $\alpha \circ \beta$ v $\K$.

> $\K^{op}$ vznikne z K otočením orientace šipek.
:::

:::priklad
Monomorfismy (resp. sekce) v $K$ jsou právě epimorfismy (resp. retrakce) v $\K^{op}$.
:::

:::priklad
1) V $\cat{Set}$ monomorfismy jsou prostá zobrazení, epimorfismy jsou surjektivní zobrazení. Retrakce jsou epimorfismy, právě tehdy když platí axiom výběru. Sekce jsou monomorfismy s neprázdnou doménou a $1_\emptyset$. monomorfismus + epimorfismus = izomorfismus.

2) V $\cat{Ab}$, obecněji v $\cat{Mod-R}$, $R$ okruh, platí, že monomorfismy jsou prosté morfismy, epimorfismy jsou surjektivní morfismy.

3) V $\cat{Top}$ jako výše.

4) V $\cat{Grp}$ jako výše, ale pro epimorfismy není triviální ukázat, že jsou surjektivní.

5) $id_\mathbb{Z}: \mathbb{Z} \hookrightarrow \mathbb{Q}$ není sekce, protože $\mathbb{Q}$ je divizibilní, ale $\mathbb{Z}$ není.

6) $\mathbb{Q} \twoheadrightarrow \mathbb{Q}/ \mathbb{Z}$ není retrakce.

7) Ve 2) a 4) mono + epi = izo, ale v 3) tomu tak není.

8) $\cat{Div}$ je kategorie divizibilních abelovských grup. Epimorfismy jsou surjektivní morfismy, monomorfismy jsou morfismy $\alpha$, kde $\Ker \alpha$ je redukovaná grupa, tj. nemá netriviální divizibilní podgrupy. $\mathbb{Q} \twoheadrightarrow \mathbb{Q}/ \mathbb{Z}$ je monomorfismus a epimorfismus, ale není izomorfismus.

9) $\cat{TF}$ je kategorie beztorzních abelovských grup. Pak epimorfismy jsou CV. ($\mathbb{Z} \hookrightarrow \mathbb{Q}$).

10) V kategorii $\cat{Haus}$ jsou monomorfismy prosté morfismy. Epimorfismy jsou spojitá zobrazení na hustou část. $\mathbb{Q} \hookrightarrow \mathbb{R}$ je epimorfismus.
:::

:::definice
Kategorie se nazývá *balancovaná*, pokud "mono + epi je izo".
:::

:::definice
Buď $\K$, $\mathcal{H}$ kategorie, $F: \K \rightarrow \mathcal{H}$ se nazývá *(kovariantní) funktor*, sestává-li se z:

- $F: \ob \K \rightarrow \ob \mathcal{H}$ jakožto objektová část funktoru

- $\forall a, b \in \K, \alpha \in \K(a, b): F(\alpha) \in H(\alpha(a), \alpha(b))$. Navíc splňuje $F(1_a) = 1_{F(a)}$ a $F(\beta \circ \alpha) = F(\beta) \circ F(\alpha)$, je-li $\beta \alpha$ definováno v $\K$.

$G: \K \rightarrow \mathcal{H}$ je *kontravariantní funktor*, pokud $G(\beta \circ \alpha) = G(\alpha) \circ G(\beta)$, tj. "G otáčí šipky".
:::

:::pozn
Občas se ztotožňuje kontravariantní funktor $G: \K \rightarrow \mathcal{H}$ s odpovídajícím kovariantním funktorem $\K^{op} \rightarrow \mathcal{H}$ ($\K \rightarrow \mathcal{H}^{op}$).
:::

:::priklad
1) $P^+: \cat{Set} \rightarrow \cat{Set}$. $\forall a \in \ob \K: P^+(a) = \mathcal{P}(a)$, $\alpha: a \rightarrow b: P^+(a): \mathcal{P}(a) \rightarrow \mathcal{P}(b)$, tkž $x \rightarrow \alpha[x] = \{ \alpha(p) | p \in x \} \in \mathcal{P}(b)$.


2) $P^-: \cat{Set} \rightarrow \cat{Set}$. $P^-(a) = P^+(a) = \mathcal{P}(a)$. $P^-(\alpha): \mathcal{P}(b) \rightarrow \mathcal{P}(a)$, tkž $y \rightarrow \{ p \in a | \alpha (p) \in y \}$.
:::

___

\begin{center}
Přednáška 3
\end{center}
