
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
  markup-system-spacing = #'((basic-distance . 30)
                             (minimum-distance . 20)
                             (padding . 2))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Place du Tertre"
composer = #"Biréli Lagrène"
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
  asplayed = #"Biréli Lagrène" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=yJJ3J2eKDw4"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
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
  s8*5 f1:7+ e2:m5-7 a:9- d:m7 des:9+ c:m7 f:7
  bes1 bes2:m7 es:7 a:13 a:5+7 d:9 d:7
  g1:m c:7 a2:m5-7 d:9- g:m7 c:7
  g:m7 a:m bes:m c:7.11 f1*2:7+
  g2:m7 c:7 a:m7 d:7 g2:m7 c:7 f:6 f:7+/a b:m7 e:7
  bes:m7 es:7 a:m7 d:7 g1:m7 c:7
  f1:7+ e2:m5-7 a:9- d:m7 des:9+ c:m7 f:7
  bes1 bes2:m7 es:7 a:13 a:5+7 d:9 d:7
  g1:m7 c:7 f1*2:7+
}


theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 4/4
  \partial 8*5 c8 f4 g | \A
  \repeat volta 2 {
    a r a8 as a bes | a4 r8 a, bes cis e a |
    g4 f f r8 a16 f | g4 \tuplet 3/2 { f8 f4~ } f r8 d' | \break
    c4 r8 bes c bes f des | c'4 r bes8 f \tuplet 3/2 { g c a~ } |
    a1~ | 8 r r4 a a \break
  }
  \alternative {
    { a4 g f g | as16( g f) g~ g4 r8 f \tuplet 3/2 { g c a~ } |
      a1~ | 4 r8 c,8 f4 g  \break}
    { a4 g f g | as16( g f) g~ g4 r8 f e f~ |
      f1 | R1 \break }
  }
  \B \bar "||" f4 d8 f e d c b | g'8. e16 g8 fis~ fis2 |
  a4 \tuplet 3/2 { r8 d, a' } g a bes c~ |
  c2. \tuplet 3/2 { r8 des d } | e4~ \tuplet 3/2 { e8 des a } as2 | \break \noPageBreak
  es'4~ \tuplet 3/2 { es8 c as } g2 | d'4~ \tuplet 3/2 { d8 b g } fis2 |
  r4 a \tuplet 3/2 { a f8 } d g~ | g4 r8 c,8 f4 g
  \A \bar "||" \break
  a r a8 as a bes | a4 r8 a, bes cis e a |
  g4 f f r8 a16 f | g4 \tuplet 3/2 { f8 f4~ } f r8 d' | \break
  c4 r8 bes c bes f des | c'4 r bes8 f \tuplet 3/2 { g c a~ } |
  a1~ | 8 r r4 a a \break
  a d, f g | as16( g f) g~ g4 r8 f e f~ |
  f1 | R1 \bar ".."
}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \repeat volta 2 {
    f1:7+ \/e2:m5-7 a:9- \/d:m7 des:9+ \/c:m7 f:7 \break
    bes1 \/bes2:m7 es:7 \/a:13 a:5+7 \/d:9 d:7 \break }
  \alternative {
    { g1:m c:7 \/a2:m5-7 d:9- \/g:m7 c:7  \break}
    { \/g:m7 a:m \/bes:m c:7.11 \repeat percent 2 f1:7+ \bar "||" \break }
  }
  \/g2:m7 c:7 \/a:m7 d:7 \/g:m7 c:7 \break
  \/f:6 f:7+/a \/b:m7 e:7 \/bes:m7 es:7 \break
  \/a:m7 d:7 g1:m7 c:7 \bar "||" \break
  f1:7+ \/e2:m5-7 a:9- \/d:m7 des:9+ \/c:m7 f:7 \break
  bes1 \/bes2:m7 es:7 \/a:13 a:5+7 \/d:9 d:7 \break
  g1:m7 c:7 \repeat percent 2 f:7+
  \bar ".." }

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #7 A s1*15
  s1 ^\markup \bold \box \fontsize #7 B s1*8
  s1 ^\markup \bold \box \fontsize #7 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
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
    page-count = #2
  }
  #(define output-suffix "BbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
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
    page-count = #2
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
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
        >>
      >>
    } %\form
  }  \bookpart {
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
        >>
      >>
    } %\form
  }  \bookpart {
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
        >>
      >>
    } %\form
    }  \bookpart {
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

