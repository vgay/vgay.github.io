
\version "2.19.80"
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
  ragged-last = ##t
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"La Javanaise"
composer = #"Serge Gainsbourg"
meter = #"(Med. Jazz Waltz)"
kwtempo = #"Medium"
kwstyle = #"Jazz Waltz"

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
  s8 g2.:6/b bes:dim7 a:m7 d:13 a:m7 d:7 g:7+ g:6
  d:m6 g:7 c:7+9 c:6 a:7 b:7 c:6 e:m7
  c:6 cis:dim g:6/d e:7 a:7 a:7 d:7 d:5+7/ais
  d:7/a g:6
}


theNotes =  \relative c'' {
  \clef "treble" \key g \major \time 3/4
  \partial 8
  g8 \bar "[|:" a8 g a g a g | a2 r8 g | fis a4. r4 | r2 r8 a8 | \break
  b a b a b a | b2 r8 a | g b4. r4 | r2. | \break \bar "||"
  b | d2 ~ d8 e | d2. | c |
  b4 cis e | dis b a | a2. | g | \break
  a | bes2 bes4 | b!2. | b4 c4. b8 | b2. \toCoda |
  g2. | a | r2 r8 \parenthesize g \break \lastCoda \bar ":|]"
  a2. | g | r2. \bar "|."
}

verse = \lyricmode {
  J'a -- voue j'en ai ba -- vé pas vous mon a -- mour
  A -- vant d'av -- oir eu vent de vous mon a -- mour
  Ne vous dé -- plai -- se
  En dan -- sant la Ja -- va -- nai -- se
  Nous nous ai -- mions
  Le temps d'un -- e chan -- son \skip 1 chan -- son.
}

verseBC = \markup \fontsize #2
{
  \vspace #5
  \fill-line {
    \hspace #1
    \column {
      \line { 2- }
      \line { À votre avis qu'avons nous vu de l'amour ? }
      \line { De vous à moi vous m'avez eu mon amour }

    }
    \hspace #2
    \column {
      \line { 3- }
      \line { Hélas avril en vain me voue à l'amour }
      \line { J'avais envie de voir en vous cet amour }
    }
    \hspace #2
}}
verseD = \markup \fontsize #2
{
  \vspace #1
  \fill-line {
    \column {
      \line { 4- }
      \line { La vie ne vaut d'être vécue sans amour }
      \line { Mais c'est vous qui l'avez voulu mon amour }
  }}
}
Guitare = \relative c' {
  \clef "treble_8" \key g \major \time 3/4
  \partial 8 r8
  <g d' e>4 q2 | <g des' e>2 r4 | r4 <g d' e>2 | <a d b>2. |
  <g c e>4 q2 | <a c fis>2 r4 | <d, g b fis'>2 q4 | <d g b e>2. |
  <a' d f>2 q4 | <b d f >2 r4 | <g b e>2 g4 | <a c e>2 r4 |
  <e a cis g'>2 q4 | <a d fis>2 r4 | r4 <g c e>2 | <g b d>2. |
  <g e' a>4~ \tuplet 3/2 { q g a } | <g e' bes>4~ \tuplet 3/2 { q g bes } |
  <c e' b>4~ \tuplet 3/2 { q g b } | <d, gis b e>2 r4 |
  <g cis e>2 r4 | r4 q2 | <a c fis>2 q4 | <d, ais' c fis>2 r4 |
  <a' c fis>2 r4 | <g b d e>2.~ | q |
}

Tablas = \relative c' {
  \clef "treble_8" \key g \major \time 3/4
  \partial 8 s8
  <g d' e>2. | <g des' e> | <g d' e>| <a d b> |
  <g c e> | <a c fis> | <d, g b fis'> | <d g b e> |
  <a' d f> | <b d f > | <g b e> | <a c e> |
  <e a cis g'>| <a d fis> | <g c e> | <g b d> |
  <g e' a> | <g e' bes> |
  <c e' b>| <d, gis b e> |
  <g cis e> | q | <a c fis> | <d, ais' c fis> |
  <a' c fis> | <g b d e>| s |
}


Basse = \relative c' {
  \clef "bass" \key g \major \time 3/4
  \partial 8 r8
  \repeat volta 2 {
    b2 r4 | bes2 r4 | a2 e4 | d fis a | a2 e4 | d2 a'4 | g2 d4 | g d b \bar "||" \break
    d2 a'4 | g2 d4 | c2 g4 | c e g | a2 e4 | b'2 fis4 | c'2 g4 | e' b g \break
    c,2 g'4 | cis,2 g'4 | d2 g4 | e2 b'4 | a2 e4 | \toCoda a,2 e'4 | d fis a | ais2. } \break
  \Coda a2 d,4 | g2 d4 | g,2 r4 \bar ".."

  \bar ".."
}

grille = \chordmode {
  \bar "[|:"
  g1:6/b bes:dim7 a:m7 d:13 \break
  a:m7 d:7 g:7+ g:6 \break
  d:m6 g:7 c:7+9 c:6 \break
  a:7 b:7 c:6 e:m7 \break
  c:6 cis:dim g:6/d e:7 \break
  a:7 \Coda a:7 d:7 d:5+7/ais \break \bar "|."
  \stopStaff s \startStaff
  \Coda d:7/a \repeat percent 2 g:6
  \bar ".." }

marques = \relative c' {

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
          \transpose c a, \theNotes
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
        >>
      >>
    } \verseBC \verseD
  }   \bookpart {
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
        >>
      >>
    } \verseBC \verseD
  }   \bookpart {
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
        \transpose c d \grille
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
          \transpose c a, \theNotes
          \addlyrics \verse
        >>
      >>
    } \verseBC \verseD
  }   \bookpart {
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
        \transpose c a \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "RSa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup
        <<
          \new FretBoards \Tablas
          \new Staff \with { instrumentName = "Guit." } \Guitare
          \new Staff \with { instrumentName = "Bass" } \Basse
        >>
      >>
    }
    }   \bookpart {
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