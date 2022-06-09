
\version "2.22.0"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Au bois de mon cœur"
composer = #"Georges Brassens"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"
kwfrench = #"Oui"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  % asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  arranger = "Ar. Vincent Gay"
  tagline = ##f
}

\layout {
  \context {
    \Score
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context {
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
}


\layout {
  \context {
    \Score
    extraNatural = ##f
    \omit BarNumber
    skipBars = ##t
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  a1:m7 d2:7 dis:dim7 e:7 d:7 c e:7
  a1:m7 d2:7 dis:dim7 e1:7+ s
  a1:m7 d2:7 dis:dim7 e:7 d:7 c e:7
  a1:m7 d2:7 dis:dim7 e:7 d:7 c e:7
  d1:m7 d:m7 g:7 c2:7+ e4:m c4:7
  a1:7 d:m7 a:m7 f2:7+ e:
  a1:m7 d2:7 dis:dim e:7 d:7 c e:7
  a1:m7+
}
harmoniesV = \chordmode {
  \set chordChanges = ##t
  a1:m7 d2:7 dis:dim7 e:7 d:7 c e:7
  a1:m7 d2:7 dis:dim7 e1:7+ s
  a1:m7 d2:7 dis:dim7 e:7 d:7 c e:7
  a1:m7 d2:7 dis:dim7 e:7 d:7 c e:7
  d1:m7 d:m7 g:7 c2:7+ e4:m c4:7
  a1:7 d:m7 a:m7 f2:7+ e:
  a1:m7 d2:7 dis:dim e:7 d:7 c e:7
  c e:7  a1:m7+
}


theNotes =  \relative c' {
  \clef "treble" \key c \major \time 4/4
  \Intro
  R1 *2  | e'8 c a e' ees d4 r8 | c a e c' b gis4 r8 | % 4
  R1 *2  | e'8 a4 d,8 g4 r8 c, | f8 dis4 e8~ e4 r |  \break % 8
  \mark #1 \repeat volta 2 {
    a,2 c | d4. dis8~ dis2 | e4 a,8 d~ d a d4 | c a8 b~ b e, b'4 | \bar "||" \break% 12
    a2 c | d8 c a dis~ dis2 | r8 e4 a,8 d4 a8 d | r8 c4 a8 b4 e \bar "||"  \break % 16
    \mark #2
    a4. a8~ a d, f a~ | a2~ a8 a b c | b2~ b8 a g fis | g4-^ a, b c | \break % 20
    cis8 g' a bes a g f e | f2 d4 e8 a,~ | a2~ a8 e' dis e~ | e1 \bar "||"  \break
    \mark #1
    a,2 c | d8 c a dis~ dis2 | r8 e4 a,8 d4 a8 d | r8 c4 a8 b4 e }

  b1 \fermata _\markup "(Last X)"
  \bar ".."
}

theNotesII =  \relative c' {
  \clef "treble" \key c \major \time 4/4
  \Intro
  R1 *6  | e'8 c4 d8 b4 r8 f | bes8 gis4 a8~ 4 r |  \break % 8
  \mark #1 \repeat volta 2 {
    a2 g | fis4. 8~ 2 | r8 e4 fis8~ 2| r8 e4 gis8~ 2 | \bar "||" \break% 12
    a2 g | fis4. 8~ 2 | r8 e4 fis8~ 2| r8 e4 gis8~ 2 |  \bar "||"  \break % 16
    \mark #2
    f4. 8~ 8 d e f~ | 2~ 8 4 8~ | 2~ 8 8 e dis  | e4-^ e g bes | \break % 20
    cis2. r8 c8| 8 4. 8 4. | 8 4. 8 4. | a8 4. b2  \bar "||"  \break
    \mark #1
    a2 g | fis4. 8~ 2 | r8 e4 fis8~ 2| r8 e4 gis8~ 2 | }

  gis1 \fermata _\markup "(Last X)"
  \bar ".."
}

\layout {
  \context {
    \ChordNames
    \consists Script_engraver
    \consists Text_engraver
    \consists
      #(lambda (context)
         (let ((chord-name #f)
               (scripts '()))
           (make-engraver
            (acknowledgers
             ((chord-name-interface engraver grob source-engraver) ;; détecte les ChordName
              (set! chord-name grob))
             ((script-interface engraver grob source-engraver) ;; détecte les Script
              (set! scripts (cons grob scripts))))
            ((stop-translation-timestep engraver)
             (if chord-name
                 (for-each
                   (lambda (s)
                     ;; Le ChordName devient parent du Script...
                     (ly:grob-set-parent! s X chord-name)
                     (ly:grob-set-parent! s Y chord-name)
                     ;; ... et c'est contre lui que le Script se positionne.
                     (ly:pointer-group-interface::add-grob s 'side-support-elements chord-name))
                   scripts))
             (set! chord-name #f)
             (set! scripts '())))))
    %% Réglage de la distance entre le nom d'accord et le script
    \override Script.padding = 1.2
  }
}


grille = \chordmode {
  \bar "[|:" \mark #1
  a1:m7 d2:7 dis:dim7 e:7 d:7 c e:7 \break \mark #2 \bar ":|]"
  \repeat percent 2 d1:m7 g:7  c2:7 e4:m c:7 \break
  a1:7 d:m7 a:m7 f2:7+ e \break \mark #1  \bar "||"
  a1:m7 d2:7 dis:dim7 e:7 d:7 c e:7 \break \bar "|."
  \mark \markup  \with-color #red \musicglyph "scripts.varcoda"
  a1:m7+ \fermata \bar ".." \stopStaff s \bar ""  s \bar "" s \bar ""
}

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #7 A s1*7
  s1 ^\markup \bold \box \fontsize #7 B s1*7
  s1 ^\markup \bold \box \fontsize #7 A s1*3
  s2 s2 ^\markup { \musicglyph "scripts.ufermata" }
}


Vocal =  \relative c'' {
  %\set Staff.instrumentName = " "
  \clef "treble" \key c \major \time 4/4
  \Intro
  R1*8 \break \mark #1
  \repeat volta 4 {
    a2 c | d4. dis8~ dis2 | e4 a,8 d~ d a d4 | c a8 b~ b e, b'4 | \break
    \mark #1 a2 c | d8( c a) dis~ dis2 | r8 e4 a,8 d4 a8 d | r8 c4 a8 b4 e | \break
   \mark #2 a,8 a' a a a a \tuplet 3/2 { d, f a~ }  | a2~ a8 a b c | b2~ b8 a g fis | g4-^ a, b c | \break
    cis8 g' a bes a g f e | f2 d4( e8) a,~ | a2~ a8 e' dis e~ | e1 | \break
    \mark #1 a,2 c | d4. dis8~ dis2 | e4 a,8 d~ d a d4 }
  \alternative {
    {r8 c4 a8 b8 e8 e4 } {r8 c4 a8 b8 e4. }
  }
  b1 \bar ".."
}

ParolesI = \lyricmode {
  Au bois "d' Cla" -- mart y'a des pe -- tites fleurs,
  Y'a des pe -- tites fleurs,
  Y'a des co __ pains au, au bois d'mon coeur,
  Au, au bois d'mon coeur.
  Au fond d'ma cour j'suis re -- nom -- mé,
  au fond d'ma cour j'suis re -- nom -- mé,
  j'suis re -- nom -- mé,
  Pour a -- voir le coeur mal fa -- mé,
  Le coeur mal fa -- mé.
  Au bois "d' Cla" -- mart y'a des pe -- tites fleurs,
  Y'a des pe -- tites fleurs,
}

ParolesII = \lyricmode {
  Au bois "d' Vin" -- cenne y'a des pe -- tites fleurs,
  Y'a des pe -- tites fleurs,
  Y'a des co __ pains au, au bois d'mon coeur,
  Au, au bois d'mon coeur.
  Quand y'a plus d'vin dans mon ton -- neau,
  quand y'a plus d'vin dans mon ton -- neau,
  dans mon ton -- neau,
  Il n'ont pas peur de boir mon eau,
  De boi -- re mon eau.
  Au bois "d' Vin" -- cenne y'a des pe -- tites fleurs,
  Y'a des pe -- tites fleurs,
}

ParolesIII = \lyricmode {
  Au bois "d' Meu" -- don y'a des pe -- tites fleurs,
  Y'a des pe -- tites fleurs,
  Y'a des co __ pains au, au bois d'mon coeur,
  Au, au bois d'mon coeur.
  Ils m'ac -- com -- pagnent à la mai -- rie,
  ils m'ac -- com -- pagnent à la mai -- rie,
  à la mai -- rie,
  Cha -- que fois que je me ma -- rie,
  Que je me ma -- rie.
  Au bois "d' Meu" -- don y'a des pe -- tites fleurs,
  Y'a des pe -- tites fleurs,
}

ParolesIV = \lyricmode {
  Au bois "d' Saint" -- Cloud y'a des pe -- tites fleurs,
  Y'a des pe -- tites fleurs,
  Y'a des co __ pains au, au bois d'mon coeur,
  Au, au bois d'mon coeur.
  Chaqu’ fois qu'je meurs fi -- dè -- le -- ment,
  chaqu’ fois qu'je meurs fi -- dè -- le -- ment,
  fi -- dè -- le -- ment,
  Ils sui -- vent mon en -- ter -- re -- ment,
  mon en -- ter -- re -- ment.
  Au bois "d' Saint" -- Cloud y'a des pe -- tites fleurs,
  \repeat unfold 5 { \skip 1 } Au, au bois d'mon cœur.
}

Basse = \relative c {
  \set Staff.instrumentName = "Basse "
  \clef bass
  \Intro
  a2 c | d dis | e4 dis d cis | c b gis e | % 4
  a2 c | d dis | e8 r r4 r2 | R1  | \break %8
  \mark #1 \repeat volta 2 {
    a4 e a g | d fis dis fis | e e d d | c c b e |  \break \bar "||" % 12
    a e a g | d fis dis fis | e dis d cis | c4 b gis e' | \break \bar "||" % 16
    \mark #2
    d e f a | d c a as | g f d b | c c e g | \break % 20
    a g e cis | d e f a | a g e c | f4 c e b | \break \bar "||" % 24
    \mark #1
    a' e a g | d fis dis fis | e dis d cis | c4 b e b | }

  a1 \fermata _\markup "(Last X)"
  \bar ".."
}
RightH = \relative c' {
  \clef G
  \Intro
  r8 e <a b>4 r8 e <a c>4 | r8 fis <a d>4 r8 fis <a dis>4 | R1  | r4 <e g b> r <e gis b> \break % 4
  r8 e <a b>4 r8 e <a c>4 | r8 fis <a d>4 r8 fis <a dis>4 | <gis dis' e>8 r r4 r2 | R1 \break %8
  \mark #1 \bar "[|:"
  r4. <e a c>8~ <e a c>4 r8 <fis a c>~ | <fis a c>4 r8 <fis a c>~ <fis a c> <fis a c>4 r8 | % 10
  <gis d'>4 <gis d'>8 <fis c'>~ <fis c'>4 <fis c'> | <e c'> <e c'>8 <d gis>~ <d gis>4 <d gis>   \break| % 12
  \mark #1
  r4. <e a c>8~ <e a c>4 r8 <fis a c>~ | <fis a c>4 r8 <fis a c>~ <fis a c> <fis a c>4 r8 | % 10
  <gis d'>4 <gis d'>8 <fis c'>~ <fis c'>4 <fis c'> | <e c'> <e c'>8 <d gis>~ <d gis>2   \break| % 12

  \mark #2
  r8 <f c'>4 r8 <f c'>4 <f c'> | r8 <f c'>4 r8 <f c'>2 | % 18
  r8 <f b>4 r8 <f b>4 <f b> | r <c e> <e g> <g bes> |  \break % 20
  <g cis> <g cis>8 <g cis>~ <g cis>4 <g cis> | <f c'>8 <f c'>4. <f c'>8 <f c'>4. | % 22
  <g c>8 <g c>4. <g c>8 <g c>4. | <e a>8 <e a>4. <e b'>2 |  \break \bar "||" % 24
  \mark #1
  r4. <e a c>8~ <e a c>4 r8 <fis a c>~ | <fis a c>4 r8 <fis a c>~ <fis a c> <fis a c>4 r8 | % 26
  <gis d'>4 <gis d'>8 <fis c'>~ <fis c'>4 <fis c'> | <e c'>4 <e c'>8 <d gis>~ <d gis>4 <d gis> | \break \bar ":|]" % 28
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \once \override Score.RehearsalMark #'direction = #DOWN
  \mark \markup "(Last X)"
  <c e gis>1 \fermata \bar "|."

}

LeftH = \relative c {
  \clef bass

  a2 c | d dis | e4 dis d cis | c b gis e | % 4
  a2 c | d dis | e8 r r4 r2 | R1  | %8

  e8 a c r e, a c r | fis, a c <dis, a'>~ <dis a'> <dis a'>4 r8 | % 10
  <e b'>4 <e b'>8 <d a'>4 <d a'>8 r4 | <c g'> <c g'>8 <b fis'>4 <b fis'>8 r4 | % 12
  e8 a c r e, a c r | fis, a c <dis, a'>~ <dis a'> <dis a'>4 r8 | % 10
  <e b'>4 <e b'>8 <d a'>4 <d a'>8 r4 | <c g'> <c g'>8 <b fis'>8~ <b fis'>2  | % 12


  <d a'>8 r r <d a'> r <d a'> r4 | <d a'>8 r r <d a'> r r r4 | % 18
  <d g>8 r r <d g> r <d g> r4 | <c g'>-^ c4 e g | % 20
  <e a> <e a>8 <e a>4 <e a>8 r4 | <d a'>8 <d a'>4. <d a'>8 <d a'>4. | % 22
  <e a>8 <e a>4. <e a>8 <e a>4.| <f c'>8 <f c'>4. gis2 | % 24

  e8 a c r e, a c r | fis, a c <dis, a'>~ <dis a'> <dis a'>4 r8 | % 26
  <e b'>4 <e b'>8 <d a'>4 <d a'>8 r4 | <c g'>4 <c g'>8 <b e>4 <b e>8 r4 | % 28
  <e a>1
}

Guitare =  \relative c' {
  %\set Staff.instrumentName = " "
  \Intro
  r8  e8  <a b>4 r8  e8  <a c>4 | r8  fis8  <a d>4 r8  fis8  <a dis>4 | % 5
  R1 | R |
  r8  e8  <a b>4 r8  e8  <a c>4 | r8  fis8  <a d>4 r8  fis8  <a dis>4 | % 9
  R1*2 \break \mark #1 \bar "[|:"
  e8  a8  c8  e8  e,8 a8  c8  fis8 | fis,8  a8  c8  <a dis>8 ~ <a dis>8  <a dis>4 r8 |
  <d, gis b e>4  <d gis b e>8  <d a' c fis>4 <d a' c fis>8 r4 | % 14
  <e g c e>4  <e g c e>8  <d gis b e>4 <d gis b e>8 r4 | \break
  e8  a8  c8  e8  e,8 a8  c8  fis8 | fis,8  a8  c8  <a dis>8 ~ <a dis>8  <a dis>4 r8 |
  <d, gis b e>4  <d gis b e>8  <d a' c fis>4 <d a' c fis>8 r4 | % 18
  <e g c e>4  <e g c e>8  <d gis b e>8 ~ <d gis b e>2 \break \mark #2 \bar "||"
  d8  <a' c f>4  d,8  <a' c f>4 <a c f>4 | d,8  <a' c f>4  d,8  <a' c f>2 | % 21
  d,8  <g b f'>4  d8  <g b f'>4 <g b f'>4 | <g, c e>4  <c e g>4  <e g b>4  <g bes e>4 | \break
  <e a cis g'>4  <e a cis g'>8  <e a cis g'>4  <e a cis g'>8 r4 | % 24
  <d a' c f>8  <d a' c f>4.  <d a' c f>8 <d a' c f>4. | % 25
  <e a c g'>8  <e a c g'>4.  <e a c g'>8 <e a c g'>4. | % 26
  <f a c e>8  <f a c e>4.  <e gis b>2 |\break \mark #1 \bar "||"
  e8  a8  c8  e8  e,8 a8  c8  fis8 | fis,8  a8  c8  <a dis>8 ~ <a dis>8  <a dis>4 r8 | % 29
  <d, gis b e>4  <d gis b e>8  <d a' c fis>4 <d a' c fis>8 r4 |
  <e g c e>4  <e g c e>8  <d gis b e>8 ~ <d gis b e>2 |
  \break \bar ":|]"
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \once \override Score.RehearsalMark #'direction = #DOWN
  \mark \markup "(Last X)"
  <a e' gis c fis>1 \fermata \bar ".."
}



\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "2nd voice next page" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
}
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotesII
        >>
      >>
    } %\form
} }



\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab")
  \header { meter = \markup \with-color #red \bold "2nd voice next page" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
}
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotesII
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "2nd voice next page" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }

        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotes
        >>
      >>
    } %\form
}
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotesII
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
        \new Staff \theNotesII
      >> >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
        \new Staff \transpose c d \theNotesII
      >> >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a, \theNotes
        >>
        \new Staff \transpose c a, \theNotesII
      >> >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Vocala4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \harmoniesV
        }
        \new Staff \with {
          instrumentName = "Vocal"
        }
        <<
          \new Voice = "Mel" { \Vocal }
          \addlyrics { \ParolesI }
          \addlyrics { \ParolesII }
          \addlyrics { \ParolesIII }
          \addlyrics { \ParolesIV }
        >>

      >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  \bookpart {
    #(define output-suffix "Bassa4")
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \harmonies
        }
        \new Staff
        <<
          \set Staff.instrumentName = "Basse"
          \new Voice = "Mel" { \clef "bass" \Basse }
        >>
      >>
    }
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
      >>
} } }

\book {

  \bookpart {
    \paper {
      #(set-paper-size "a4")
      page-count = #1
      ragged-last = ##t
    }
    #(define output-suffix "Pianoa4")
    \score {
      \relative c' <<

        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new PianoStaff
        <<
          \set PianoStaff.instrumentName = "Piano "
          \new Staff << \RightH >>
          \new Staff << \LeftH >>
        >>
      >>
    }
  }
}

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    ragged-last = ##t
  }
  #(define output-suffix "Guitara4")
  \bookpart {
    \score {

      <<
        \new ChordNames {
          \set chordChanges = ##f
          \harmonies
        }
        \new StaffGroup <<
          \new Staff
          <<
            \set Staff.instrumentName = "Guitare"
            \new Voice = "Mel" { \Guitare }
          >>
          \new TabStaff \transpose c c, \Guitare
          % \with {
%             stringTunings = #`( ,(ly:make-pitch 0 2 0)
%                                 ,(ly:make-pitch -1 6 0) ,(ly:make-pitch -1 4 0)
%                                 ,(ly:make-pitch -1 1 0) ,(ly:make-pitch -2 5 0)
%                                 ,(ly:make-pitch -2 2 0) )
%           }
%           << \Tab >>
        >>
      >>
      \layout{
        #(layout-set-staff-size 18)
      }
    } %\structure
} }


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  \bookpart {
    #(define output-suffix "BassTab")
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \harmonies
        }
        \new Staff
        <<
          \set Staff.instrumentName = "Basse"
          \new Voice = "Mel" { \clef "bass" \Basse }
        >>
      >>

} } }

