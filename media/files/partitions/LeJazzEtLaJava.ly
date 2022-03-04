
\version "2.22.0"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Le Jazz et la Java"
composer = #"J. Datin and Claude Nougaro"
meter = #"(Med. Jazz Waltz)"
kwtempo = #"Medium"
kwstyle = #"Jazz Waltz"
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
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  c2:7+ e4:m7 d2:m7 f4:7+ c1.:7+
  c2:7+ e4:m7 d2:m7 f4:7+ e1.:m7
  f2:7+ f4:7 e2:m7 e4:m6 d1.:m7
  c2:7+ e4:m7 d2:m7 g4:7 c1.:6

  c2.:m f:m6 c:m bes:9
  c:m f:m6 c:m as:7+
  bes:7 es bes:7 es
  g:9- c:m g4:7 c:m g:7 c2.:m
  g:9- c:m g:7 c:m
  g:9- c:m g:7 c:m7+
}


theNotes =  \relative c' {
  \clef "treble" \key c \major \time 3/4
  \showStartRepeatBar \bar "[|:"
  \set Staff.printKeyCancellation = ##f
  \A
  e4 e8 f g4 | f f8 g a4 | e r r | R2. | e4 e8 f g4 | f f8 g a4 | b r r | R2. \break
  a8 f a c b a | g e g b a g | f4 r r | R2. | e4 e8 f g4 | f f8 e d4 | c r r | R2. \bar "||" \break
  \B
  \once \override Staff.KeySignature.color = #(x11-color 'red)
  \key es \major
  g'4  es8 g es g | f4 d f | g es g | bes r r |
  g4  es8 g es g | f4 d f | g es g | c r r | \break
  bes f8 g as f | g4 fis g | bes as f? | g r r | \toCoda
  f8 es d es f d | es4 c es | d c b | c r r \bar ":|]" \break
  \Coda f8 es d f es d | es4 r es | d8 cis d f es d | c?2. |
  as'8 g f as g f | g g g g g g | g4 r b | c r r \bar "|."
}

verse = \lyricmode {
  Quand le jazz est
  Quand le jazz est là
  La ja -- va s'en
  La ja -- va s'en va
  Il y'a de l'o -- rage dans l'air
  Il y'a de l'eau dans le
  Gaz en -- tre le jazz et la ja -- va

  Cha -- que jour un peu plus y'a le jazz qui s'ins -- talle
  A -- lors la rage au coeur la ja -- va s'fait la malle
  Ses p'tit's fesses en ba -- taille sous sa ju -- pe fen -- due
  Elle é -- cra -- se sa gau -- loise et s'en va dans la rue
}

verseB = \lyricmode {
  \repeat unfold 40 { \skip 1 }
  Quand j'é -- cou -- te bé -- at un so -- lo de batt' -- rie
  V'là la ja -- va qui râle au nom de la pa -- trie
  Mais quand je crie bra -- vo à l'ac -- cor -- dé -- o -- niste
  C'est \skip 1 le jazz qui m'en -- gueule me trai -- tant de ra -- ciste
}

verseC = \lyricmode {
  \repeat unfold 40 { \skip 1 }
  Pour moi jazz et ja -- va c'est du pa -- reil au même
  J'me soûle à la Bas -- tille et m'noir -- cis à Har -- lem
  Pour moi jazz et ja -- va dans le fond c'est tout comme
  Quand le jazz dit: Go man , la ja -- va dit: Go home.
}

verseD = \lyricmode {
  \repeat unfold 40 { \skip 1 }
  Jazz et ja -- va co -- pains ça doit pou -- voir se faire
  Pour qu'il en soit ain -- si, tiens, je par -- tage en frère
  Je donne au jazz mes pieds pour mar -- quer son tem -- po
  \repeat unfold 13 { \skip 1 }
  Et je donne à la ja -- va mes mains pour le bas de son dos.
  Et je donne à la ja -- va mes mains pour le bas de son dos.
}

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
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
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
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
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a \theNotes
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
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
          \addlyrics \verse
          \addlyrics \verseB
          \addlyrics \verseC
          \addlyrics \verseD
        >>
      >>
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
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
          \addlyrics \verse
          \addlyrics \verseB
          \addlyrics \verseC
          \addlyrics \verseD
        >>
      >>
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
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes
          \addlyrics \verse
          \addlyrics \verseB
          \addlyrics \verseC
          \addlyrics \verseD
        >>
      >>
} } }

%{
convert-ly (GNU LilyPond) 2.22.1  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
