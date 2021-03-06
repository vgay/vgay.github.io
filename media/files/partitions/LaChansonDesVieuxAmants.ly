
\version "2.22.1"
#(set-global-staff-size 17)
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

title = #"La chanson des vieux amants"
composer = #"Jacques Brel"
meter = #"(Tango)"
kwtempo = #"Slow"
kwstyle = #"Tango"
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
  arranger = "arr. Vincent Gay"
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
  \context { \Score markFormatter = #format-mark-box-alphabet }
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
  e1:m6- s b:9-/dis s e1:m6 s b:9-/dis r1
  b:9-/dis s e1:m6- s b:9-/dis s e1:m6 e:m
  g1 b2:m7/fis f:7+ a:m7/e b:7/dis g1/d b:7/fis
  e:m6- s a4.:m9 fis8:m5-7 s2 b1:9-/fis c:6 cis2:m5-7 b:7
  bes:6 b:7 b1:9-/dis e:m7+9
}


theNotes =  \relative c'' {
  \clef "treble" \key e \minor \time 4/4
  \mark \markup \bold \box Intro
  R1*7 r8 b b b~ b a4 b16 c | \break \bar "||"
  \mark #1
  b4. fis8~ 2 | r8 a a a~a a g fis | e2. r4 | r8 b' b b~ b a4 b16 c | \break
  b4. fis8~ 2 | r8 a a a~a a g fis | e1 | R1 \break \bar "||-[|:"
  \mark #2
  \repeat volta 2 {
    b'4. 8 c b4 bes16 b | d4. a8 b a gis a | c4. a8 8 4 16 c |
  }
  \alternative {
    { b4. g8~ 4 r8 d } { b'2 r4 r8 b }
  }
  \break \bar "||"
  \mark #3
  c4. b8 2 | r8 b c b c b4 d16 c | b4. a8 2 | r8 a b a b a c b | \break
  a4. g8 4. a8 | g4. fis8~ 4. 8 | g2 fis | \toCoda
  fis8-^ \startParenthesis \parenthesize
  b _\markup \small "(before theme only)" b b~ b a4 b16 \endParenthesis \parenthesize c
  \bar "|." \break \Coda
  \tuplet 3/2 { e,4 g b } dis fis \fermata \bar ".."
}

chordsRhythm = \relative c' {
  \key e \minor \time 4/4 \oneVoice
  \repeat percent 2 { <b e g c e>2. r4 } | \repeat percent 2 { <b dis a' c fis>2. r4 } |
  \repeat percent 2 { <b e g c e>2. r4 } | <b dis a' c fis>1 | R \break \bar "    --"
  \mark #1
  b8 dis fis a b2 | <fis b>4. <fis dis'>8~ q2
  r8 g b fis~ fis e4. | g4 fis8 <fis b>~ q2
  dis8 b' c a b2 | r8 <a c>4. <fis b>2 | r8 g b fis~ fis e4. | <g b e>2. r4 |
  \break \mark #2 \bar "||-[|:"
  \repeat volta 2 {
    <d g b g'>2 <e b'>4 <d g> | <d a' b fis'>2~ q8 <a' c e>4. |
    <a, e' g c e>2 <b dis a' c fis>  }
  \alternative {
    { d8 fis b <d g>8~ q2 } { <dis, a' b fis'>1 }
  } \break \mark #3 \bar "||"
  <b e g c e>2 \tuplet 3/2 { e'4 b g } | <e g b g'>2 e8 fis4 g8 |
  <g c e>4 e8 <fis a c>8~ 2 | r8 <b, dis a' c fis>8~ 4 <fis' b dis a'>2 |
  <e a c g'>4. q8~ 2
  <g b e>4. <fis b dis a'>8~ q2 | <bes, d g d' f>2 <fis' b dis a'> |
  \toCoda
  <b,! dis a' c fis>4-^r r2 \break \bar "|." \Coda
  <b e g c e>1 \fermata

}

Basse = \relative c {
  \clef "bass" \key e \minor \time 4/4
  \mark \markup \bold \box Intro
  \repeat percent 2 { e4. c b4 } \repeat percent 2 { dis4. c b4 }
  \repeat percent 2 { e4. c b4 } dis1 R \break \bar "||"
  \mark #1
  \repeat percent 2 { dis4. c b4 } \repeat percent 2 { e4. c b4 }
  \repeat percent 2 { dis4. c b4 } | e4. c b4 | e4. b e4 \bar "||-[|:" \break
  \mark #2
  \repeat volta 2 {
    g4. d g4 | fis2 f | e dis |
  }
  \alternative {
    { d g,8 b4 d8 } { fis1 }
  } \break \bar "||"\mark #3
  e'4. b4. g4 | e2 4 4 | a4. fis c4 | fis2 dis4 fis | c4. g'8~ 2 |
  cis,4. b8~ 2 | bes2 b \toCoda | dis4-^ r4 r2 \break \bar "|."
  \Coda e1 \fermata \bar ".."
}

grille = \chordmode {
  \repeat percent 2 e:m6- \repeat percent 2 b1:9-/dis  \break
  \repeat percent 2 e:m6-  b1:9-/dis r1 \break \bar "||"
  \repeat percent 2 b1:9-/dis \repeat percent 2 e:m6- \break
  \repeat percent 2 b1:9-/dis e:m6- e:m \bar  "||-[|:"
  g \/b2:m7/fis f:7+ \/a:m7/e b:7/dis \set Score.repeatCommands = #'((volta "1")) g1/d
  \set Score.repeatCommands = #'((volta #f) end-repeat) \break
  \stopStaff s \bar ""  s \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2"))
  b:7/fis \set Score.repeatCommands = #'((volta #f)) \bar "||" \break
  \repeat percent 2 e:m6 \/a2:m9 fis:m5-7 b1:9-/fis \break
  c:6 \/cis2:m5-7 b:7 \/bes:6 b:7 \Coda b1:9-/dis \break \bar "|."
  \Coda e:m7+9 \bar ".." \stopStaff s \bar ""  s \bar "" s \bar ""
}

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #5 Intro s1*7
  s1 ^\markup \bold \box \fontsize #5 A s1*7
  s1 ^\markup \bold \box \fontsize #5 B s1*7
  s1 ^\markup \bold \box \fontsize #5 C
}


\book {
  \paper {
    #(set-paper-size "tablette")
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
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "GuitarTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup \with { instrumentName = "Guit." }
        <<
          \new Staff \chordsRhythm
          %\new TabStaff \transpose c c, \chordsRhythm
      >> >>
    }
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

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Guitara4")
  \bookpart {
 \header { meter = \markup \pad-around # 1 \with-color #red \bold "Score with tablatures page 3" }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup \with { instrumentName = "Guit." }
        <<
          \new Staff << \chordsRhythm \\ { s1*12 \break  s1*13 \break } >>
          %\new TabStaff \transpose c c, \chordsRhythm

      >> >>
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
  }}
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup \with { instrumentName = "Guit." }
        <<
          \new Staff << \chordsRhythm \\ { s1*12 \break  s1*13 \break } >>
          \new TabStaff \transpose c c, \chordsRhythm

      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "BassTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \Basse
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \Basse
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