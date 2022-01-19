
\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



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

title = #"Desafinado"
composer = #"Tom Jobim"
meter = #"(Med. Bossa)"
kwtempo = #"Medium"
kwstyle = #"Bossa"

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
    \override NonMusicalPaperColumn #'line-break-permission = ##f
    \override NonMusicalPaperColumn #'page-break-permission = ##f
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
  f1:7+ f:7+ g:5-7 s g:m7 c:7 a:m5-7 d:9-
  g:m7 e2:m5-7 a:9- d1:7 a2:m5-7 d:9- g1:9- g1:9- ges:7+ \parenthesize c:9-
  g:m7 bes:m6 f:7+ b2:m5-7 e:9+ a1:7+ bes:dim7 b:m7 e:7
  a:7+ bes:dim7 b:m e:7 a:7+ fis:m7 b:m7 e:7
  c:7+ cis:dim7 d:m7 g:7 g:m7 es:m6 g:7 c:9-
  f:7+ f:7+ g:5-7 s  g:m7 c:7 a:m5-7 d:9-
  g:m7 bes:m6 f:7+ d:m7 g:7 g:7 bes:m7 es:9  g:7 g2:m7 c:7 f1:6 \parenthesize c:7
}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 4/4
  \showStartRepeatBar \bar "[|:" \A
  \repeat volta 2 {
    r8 c4 d8 \times 2/3  { e4 f e ~ } | e8 d4. ~ \times 2/3  { d4 cis d } |
    f4. cis8 cis2 ~ | cis r | 
    r8 d4 e8 \times 2/3  { f4 g f ~ } | f8 e4. ~ \times 2/3  { e4 dis e } |
    c'4. es,8 es2 ~ | es r | \break } 

  \alternative {
    {
      r8 d c' bes \times 2/3  {a4 g bes ~ } | bes a es e | \set Score.repeatCommands = #'((volta #f))
      \times 2/3  { fis a fis ~ } \times 2/3  { fis d es ~ } | es1 |
      r8 as4 g8 \times 2/3  {  f4 d as' ~ } | \times 2/3  { as g f ~ } f8 d4. |
      f4 des8 des ~ des des r4 | R1 \break
    }

    {
      \times 2/3  { r4 c' bes } \times 2/3  { a g bes ~ } | \times 2/3  { bes a2 } g4 f |
    }
  }
  g f8 g ~ g2 ~ | g2. r8 f 
  e4 fis \times 2/3  { e fis e ~ } | e2 ~ \times 2/3  { e4 d des } |
  e1 ~ | e2. r8 cis | \break \bar "||" \B

  e4 fis \times 2/3  { e fis e ~ } | \times 2/3  { e d2 } cis4 d |
  e b8 b ~ b b e4 ~ | e1 |
  \times 2/3  { r4 e fis } \times 2/3  { gis a b ~ } | \times 2/3  { b a2 } cis,4 d |
  r4 e8 fis \times 2/3  { e4 f e ~ } | e2 r8 e4. \break

  g a8 \times 2/3  { g4 a g ~ } | \times 2/3  { g f2 } e8 f e f |
  g4 d8 g ~ g d g4 ~ | g2 r8 g4. |
  bes a8 \times 2/3  { bes4 a c ~ } | \times 2/3  { c bes2 } a4 bes |
  g1 ~ | g2. r4 \bar "||" \break
  \C
  r4 c,4  \times 2/3  { d4 e f } | \times 2/3  { e d cis ~ } \times 2/3  { cis d f ~ } |
  f4 cis8 cis ~ cis2 ~ | cis2. r4 |
  \times 2/3  { r4 d4 e } \times 2/3  { f g f ~ } | \times 2/3  { f4 e2 } dis4 e |
  d'4. des8 \times 2/3  { c4 b bes ~ } | \times 2/3  { bes4 d2 ~ } d4 a \break

  \times 2/3  { r4 c b  } \times 2/3  { bes a bes ~ } | bes8 a4. g4 f |
  a2 ~ a8 e4. | g2. d8 e |
  f8 f f f \times 2/3  { f4 f2  } | R1 | \break

  f8 f f f c'4 bes ~ | bes2 ~ bes8 d,4 e8
  f8 f f f f4 e8 f ~ | f e4. dis4 e |
  g f8 f~ f2 | R1 \bar "|." \noPageBreak
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
  \bar "[|:"
  \repeat percent 2 f1:7+ \repeat percent 2 g:5-7 \break
  g:m7 c:7 a:m5-7 d:9- \break
  \set Score.repeatCommands = #'((volta "1"))
  g:m7 \set Score.repeatCommands = #'((volta #f))
  \/e2:m5-7 a:9- d1:7 \/a2:m5-7 d:9- \break
  \repeat percent 2 g1:9- ges:7+ \parenthesize c:9- \pageBreak
  \set Score.repeatCommands = #'((volta "2") end-repeat)
  g:m7 \set Score.repeatCommands = #'((volta #f)) bes:m6 f:7+ \/b2:m5-7 e:9+ \break
  a1:7+ bes:dim7 b:m7 e:7 \bar "||" \break
  a1:7+ bes:dim7 b:m7 e:7 \break
  a:7+ fis:m7 b:m7 e:7 \break
  c:7+ cis:dim7 d:m7 g:7 \break
  g:m7 es:m6 g:7 c:9- \bar "||" \break
  \repeat percent 2 f1:7+ \repeat percent 2 g:5-7 \break
  g:m7 c:7 a:m5-7 d:9- \break
  g:m7 bes:m6 f:7+ d:m7 \break
  \repeat percent 2 g:7 bes:m7 es:9 \break
  g:7 \/g2:m7 c:7 f1:6 \parenthesize c:7
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*23
  s1 ^\markup \bold \box \fontsize #7 B s1*15 
  s1 ^\markup \bold \box \fontsize #7 C
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes \\ { s1*40 \pageBreak }
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
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes \\ { s1*40 \pageBreak }
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
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes \\ { s1*40 \pageBreak }
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
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
  \paper {
    #(set-paper-size "a4")
    page-count = #2
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
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
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
        \transpose c a \grille
      >>
} } }