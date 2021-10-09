
\version "2.22.0"
#(set-global-staff-size 18)
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

title = #"I Get A Kick Out Of You"
composer = #"Cole Porter"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"

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
  f1:m7 bes:9- es:7+ g2:m c:9- f1:m7 bes:9- es:7+ g2:m7 c:9- 
  f1:m7 bes2:7 as:7 g:7 g:5+7 c1:7 f:m7 bes:9- es2:7+ as:7 g:m c:9+
  g1:m7 c:9- 
  f:m7 bes:7 d2:m g:7 g:m5-7/c c:9- f1:m7 bes:9- es1*2:7+
  bes:m/es bes:m7+/es bes1:m/es es:7 g:m5-7 c:7
  f:m7 d:m5-7 g:9+ c:9- f1*2:7 f1:m5-7 bes:7
  es2:7+ g:m7/d c1:m7 f:m7 bes2:7 as:7 g:7 g:5+7 c:7 c:9-
  f1:m7 bes:7 es:7+
  \startParenthesis \parenthesize g2:m7 \endParenthesis \parenthesize c:7
}


theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \set Score.voltaSpannerDuration = #(ly:make-moment 8 4)
  \repeat volta 3 { 
    r4 c d es | \times 2/3 { f2 g as } | bes1 ~ | bes |
    r4 c, d es | \times 2/3 { f2 g as } | }
  \alternative {  
    { \times 2/3 { bes as g } | g2. g4 \bar "||" \break
    \times 2/3 { as2 g f } | \times 2/3 { f es f } | g1 ~ | g2 r4 c, |
    f g as bes ~ | bes as2 g4 | es1 ~ | es4 r2. \break }
    { \times 2/3 { bes'2 c a } | \times 2/3 { bes c a }  |  \bar "||"
    \times 2/3 { bes c a } | \times 2/3 { bes a as } | g1 ~ | g2 r4 c, |
    f g as bes ~ | bes as2 g4 | es1 ~ | es4 r2. \bar "||" \break
    r4 es f g | \times 2/3 { as2 bes c } | des2. c4 | des2 r4 c |
    c2. bes4 | c2. bes4 | bes1 | c, |  \bar "||" \break
    r4 c d e | \times 2/3 { f2 g as } | bes2. as4 | bes2 r4 as |
    g2. f4 | f c'2 f,4 | es1 | d | \break }
    { \times 2/3 { bes'2 c d } | \times 2/3 { es f d } | \bar "||" \times 2/3 { es d c } | \times 2/3 { d c bes } | 
    g1 ~ | g2 r4 c, | \times 2/3 { f2 g as } | bes4 c2 d4 | es1 ~ | es4 r2.
    }
} }

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
   f1:m7 bes:9- es:7+ \/f2:m7 bes:9- \break
   f1:m7 bes:9- es:7+ \/g2:m7 c:9- \break \bar "||"
   f1:m7 \/bes2:7 as:7\/g:7 g:5+7 c1:7 \break
   f1:m7 bes:9- \/es2:7+ as:7 \/g:m7 c:9- \break \bar "||"
   f1:m7 bes:9- es:7+ \/f2:m7 bes:9- \break
   f1:m7 bes:9- g:m7 c:9- \break \bar "||"
   f:m7 bes:7 \/d2:m7 g:7 \/g:m5-7/c c:9- \break
   f1:m7 bes:7 \repeat percent 2 es:7+ \break \bar "||"
   \repeat percent 2 bes:m/es \repeat percent 2 bes:m7+/es \break
    bes:m/es es:7 g:m5-7 c:7 \bar "||" \break
    f1:m7 bes:9- es:7+ \/f2:m7 bes:9- \break
   f1:m7 bes:9- \/es2:7+ g:m7/d c1:m7 \break
   f1:m7 \/bes2:7 as:7\/g:7 g:5+7 \/c:7 c:9- \break
   f1:m7 bes:7 es:7+ \/g2:m7 c:7
   
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #5 A s1*15 
  s1 ^\markup \bold \box \fontsize #5 B s1*23 
  s1 ^\markup \bold \box \fontsize #5 C
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
          \transpose c a \theNotes
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

