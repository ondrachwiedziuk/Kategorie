---
nocite: '@*'
citeproc: true
documentclass: report
header-includes:
  - \newcommand{\K}{\mathcal{K}}
  - \renewcommand{\H}{\mathcal{H}}
  - \newcommand{\ob}{\text{ob\,}}
  - \newcommand{\mor}{\text{mor\,}}
  - \newcommand{\Ker}{\text{Ker\,}}
  - \newcommand{\dom}{\text{dom\,}}
  - \newcommand{\Q}{\mathbb{Q}}
  - \newcommand{\Z}{\mathbb{Z}}
  - \newcommand{\R}{\mathbb{R}}
  - \newcommand{\codom}{\text{codom\,}}
  - \newcommand{\Hom}{\text{Hom\,}}
  - \newcommand{\cat}[1]{\mathtt{#1}}
  - \newcommand*\quot[2]{{^{\textstyle#1}\big/_{\textstyle#2}}}
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

- $\ob \K$ jsou body v rovině $\R^2$, morfismy jsou lomené čáry spojující domain a codomain.
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

5) $id_{\Z}: \Z \hookrightarrow \Q$ není sekce, protože $\Q$ je divizibilní, ale $\Z$ není.

6) $\Q \twoheadrightarrow \quot{\Q}{\Z}$ není retrakce.

7) Ve 2) a 4) mono + epi = izo, ale v 3) tomu tak není.

8) $\cat{Div}$ je kategorie divizibilních abelovských grup. Epimorfismy jsou surjektivní morfismy, monomorfismy jsou morfismy $\alpha$, kde $\Ker \alpha$ je redukovaná grupa, tj. nemá netriviální divizibilní podgrupy. $\Q \twoheadrightarrow \quot{\Q}{\Z}$ je monomorfismus a epimorfismus, ale není izomorfismus.

9) $\cat{TF}$ je kategorie beztorzních abelovských grup. Pak epimorfismy jsou CV. ($\Z \hookrightarrow \Q$).

10) V kategorii $\cat{Haus}$ jsou monomorfismy prosté morfismy. Epimorfismy jsou spojitá zobrazení na hustou část. $\Q \hookrightarrow \R$ je epimorfismus.
:::

:::definice
Kategorie se nazývá *balancovaná*, pokud "mono + epi je izo".
:::

:::definice
Buď $\K$, $\H$ kategorie, $F: \K \rightarrow \H$ se nazývá *(kovariantní) funktor*, sestává-li se z:

- $F: \ob \K \rightarrow \ob \H$ jakožto objektová část funktoru

- $\forall a, b \in \K, \alpha \in \K(a, b): F(\alpha) \in H(\alpha(a), \alpha(b))$. Navíc splňuje $F(1_a) = 1_{F(a)}$ a $F(\beta \circ \alpha) = F(\beta) \circ F(\alpha)$, je-li $\beta \alpha$ definováno v $\K$.

$G: \K \rightarrow \H$ je *kontravariantní funktor*, pokud $G(\beta \circ \alpha) = G(\alpha) \circ G(\beta)$, tj. "G otáčí šipky".
:::

:::pozn
Občas se ztotožňuje kontravariantní funktor $G: \K \rightarrow \H$ s odpovídajícím kovariantním funktorem $\K^{op} \rightarrow \H$ ($\K \rightarrow \H^{op}$).
:::

:::priklad
1) $P^+: \cat{Set} \rightarrow \cat{Set}$. $\forall a \in \ob \K: P^+(a) = \mathcal{P}(a)$, $\alpha: a \rightarrow b: P^+(a): \mathcal{P}(a) \rightarrow \mathcal{P}(b)$, tkž $x \rightarrow \alpha[x] = \{ \alpha(p) | p \in x \} \in \mathcal{P}(b)$.


2) $P^-: \cat{Set} \rightarrow \cat{Set}$. $P^-(a) = P^+(a) = \mathcal{P}(a)$. $P^-(\alpha): \mathcal{P}(b) \rightarrow \mathcal{P}(a)$, tkž $y \rightarrow \{ p \in a | \alpha (p) \in y \}$.
:::

___

\begin{center}
Přednáška 3
\end{center}

:::priklad
3) $\K$ kategorie, $1_\K: \K \rightarrow \K$ identický funktor,  $1_\K(a) = 1$, $1_\K(\alpha) = \alpha$.

4) $\K, \H$ kategorie, $a \in \ob \H$. Pak $\Delta(a) = \Delta_a: \K \rightarrow \H$ konstantní na $a$.

5) $\K, \H$ jednoobjektové kategorie. Pak $F: \K \rightarrow \H$ funktory odpovídají monoidovým homomorfismům z $\K(*,*)$ do $\H(*,*)$.

6) $\K$ kategorie vektorových prostorů $\cat{Mod-T}$, kde $T$ je těleso, s lineárními zobrazeními. Pak $*: \K \rightarrow \K$ kontravariantní funktor, který $\forall V \in \ob \K$ přiřadí $V^* = \Hom(V, T)$.

    - Pro $\alpha \in \K(V, W): \alpha^*: W^* \rightarrow V^*$, $\alpha^*(f) = f \circ \alpha$.
:::

:::definice
1) $\K$ kategorie, $a \in \ob \K$, $F_a: \K \rightarrow \cat{Set}$ funktor definovaný vztahy:

    - $F_a(b) = \K(a, b)$

    - $\alpha : b \rightarrow c$, $F_a(\alpha): \K(a, b) \rightarrow \K(a, c)$, tž $\beta \rightarrow \alpha \circ \beta$.
    
    To jest *kovariantní hom-funktor* určený objektem $a$. Značí se $K(a, -)$.

2) $\K$ kategorie, $a \in \ob \K$. Uvažujme $F^a: \K \rightarrow \cat{Set}$ kontravariantní funktor definovaný:

    - $F^a = \K(b, a)$

    - $\alpha : b \rightarrow c$, $F^a(\alpha): \K(c, a) \rightarrow \K(b, a)$, tž $\beta \rightarrow \beta \circ \alpha$.
    
    To jest *kontravariantní hom-funktor* určený objektem $a$. Značí se $\K(-, a)$.

3) Součin kategorií $\K_1, \K_2$ je kategorie $\K_1 \times \K_2$.

    - $\ob \K_1 \times \K_2 = \ob \K_1 \times \ob \K_2$,

    - $\mor \K_1 \times \K_2 = \mor \K_1 \times \mor \K_2$.

    Pro libovolnou kategorii $\K$ máme k dispozici funktor $F: \K^{op} \times \K \rightarrow \cat{Set}$, tž $F(a, b) = \K(a, b)$, $F(\alpha, \beta): \K(a, b) \rightarrow \K(a', b')$, tž $\gamma \in \K(a, b) \rightarrow \beta \circ \gamma \circ \alpha$.

    To jest *hom-bifunktor*, značí se $\K(-, -)$.
:::

:::definice
Ať $F: \K \rightarrow \H$ funktor, $V$ vlastnost morfismů (např. býti monomorfismus). Pak řekneme, že $F$ *zachovává* morfismy s vlastností $V$, pokud $\forall \alpha \in \mor \K$ má vlastnost $V$ $\implies$ $F(\alpha)$ má vlastnost $V$.

Ať $F: \K \rightarrow \H$ funktor, $V$ vlastnost morfismů (např. býti monomorfismus). Pak řekneme, že $F$ *reflektuje* morfismy s vlastností $V$, pokud $F(\alpha)$ má vlastnost $V$ $\implies$ $\forall \alpha \in \mor \K$ má vlastnost $V$.
:::

:::priklad
$U: \cat{Top} \rightarrow \cat{Set}$ je *zapomínající* funktor, pokud $U((X, \tau)) = X$, $U(\alpha) = \alpha$.

- $U$ nereflektuje izomorfismy: $\alpha:(\{a, b\}, diskrétní) \rightarrow (\{a, b\}, indiskrétní)$, tž $\alpha(a) = a$, $\alpha(b) = b$, což není homomorfismus, ale $F(\alpha) = id_{\{a, b\}} = 1_{\{a, b\}}$ je izomorfismus.
:::

:::pozorovani
Každý funktor zachovává sekce i retrakce. Obecně nemusí zachovávat monomorfismy či epimorfismy.
:::

:::proof
$F: \K \rightarrow \H$, $\alpha$ sekce v $\K$ $\implies$ $\exists \beta \in \mor \K$ $\beta \circ \alpha = 1_{\dom \alpha}$.
$F(\beta) \circ F(\alpha) = F(\beta \circ \alpha) = F(1_{\dom \alpha}) = 1_{F(\dom \alpha)}$. Tedy $F(\alpha)$ je sekce.
:::

:::priklad
$F: \cat{Div} \rightarrow \cat{Ab}$ identický na objektech i na morfismech. $F$ nezachovává monomorfismy.

$\pi: \Q \rightarrow \quot{\Q}{\Z}$ přirozená projekce je monomorfismus v $\cat{Div}$.
:::

:::pozn
Funktory lze skládat, skládání je asociativní, $F: \K \rightarrow \H$, $G: \H \rightarrow \mathcal{J}$:

- $(G \circ F)(a) = G(F(a))$

- $(G \circ F)(\alpha) = G(F(\alpha))$

Skládání $\circ$ se občas vynechává.
:::

:::definice
Ať $F: \K \rightarrow \H$ funktor. Řekněme, že $F$ je:

- *Úplný*, pokud $\forall a, b \in \ob \K$ zobrazuje $F$ surjektivně množinu $\K(a, b)$ na množinu $\H(F(a), F(b))$.

- *Věrný*, pokud $\forall a, b \in \ob \K$ zobrazuje $F$ prostě množinu $\K(a, b)$ do $\H(F(a), F(b))$.

- *Prostý*, je-li věrný a navíc prostý na objektech vnoření.
:::

:::definice
$\K, \H$ kategorie. Řekneme, že $\H$ je *podkategorie* $\K$, pokud:

- $\ob \H \subset \ob \K$ $\land$ $\forall a, b\in \ob \K \H(a, b) \subset \K(a ,b)$.

- $Id: \H \rightarrow \K$, kde $Id(a) = a$, $Id(\alpha) = \alpha$ je funktor.

Je-li navíc $Id$ je úplný funktor, pak $\H$ je *úplná podkategorie* v $\K$. Tj. $\H(a, b) = \K(a, b)$.
:::

:::priklad
1) Zapomínající funktory obvykle nejsou úplné, ale jsou věrné.

2) $\mathcal{P}^-:\cat{Set}^{op} \rightarrow \cat{Set}$ není úplný, ale je prostý.
:::

:::tvrzeni
Ať $F: \K \rightarrow \H$ věrný a úplný funktor. Pak $F$ reflektuje sekce i retrakce, a tedy i izomorfismy.
:::

:::proof
Důkaz jen pro retrakce. Ať $\alpha \in \K(a, b)$, tž $F(\alpha)$ je retrakce, tj existuje $\gamma \in \H(F(b), F(a))$, tž $F(\alpha) \circ \gamma = 1_{F(b)}$. $F$ je věrný a úplný, tedy existuje právě jedno $\beta \in \K(b, a): F(\beta) = \gamma$. Pak $F(\alpha \circ \beta) = F(\alpha) = F(\beta) = 1_{F(b)} = F(1_b)$. Jelikož $F$ je věrný, tak $\alpha \circ \beta = 1_b$. Tedy $\alpha$ je retrakce.
:::

:::priklad
1) $\K(a, -)$ zachovává monomorfismy.

2) $\K(-, b)$ kontravariantní posílá epimorfismy na monomorfismy.
:::

:::definice
Buď $\K$ kategorie, pak řekneme, že $a\in\ob\K$ je *projektivní*, pokud $\K(a, -)$ zachovává epimorfismy. Dále $a\in\ob\K$ je *injektivní*, pokud funktor $K(-, a)$ zachovává epimorfismy.
:::

:::priklad
V $\cat{Ab}$ jsou volné grupy projektivní objekty a divizibilní grupy jsou injektivní objekty.
:::

:::definice
$\K$ kategorie, $a\in\ob\K$. Pak

1) $a$ je *generátor (separátor)* v $\K$, je-li funktor $K(a, -)$ věrný.

2) Řekneme, že $a$ je *kogenerátor* (*koseparátor*), pokud je $\K(-,a)$ věrný.
:::

:::priklad
1) V $\cat{Set}$ jsou generátor právě neprázdné množiny, kogenerátory jsou alespoň dvouprvkové množiny.

2) V $\cat{Ab}$ je generátor $\Z$, kogenerátor je $\quot{\Q}{\Z}$.
:::

:::definice
*Konkrétní* kategorie je dvojice $(\K, U)$, kde $\K$ je kategorie a $U: \K \rightarrow \cat{Set}$ je věrný funktor.
:::

:::priklad
$\cat{Ab}$, $\cat{Ring}$, $\cat{Top}$, \dots $U$ zapomínající funktor.
:::

:::priklad
$\cat{Cat}$ je kategorií je kategorie malých kategoriích, morfismy jsou funktory mezi nimi.
:::

___

\begin{center}
Přednáška 4
\end{center}
