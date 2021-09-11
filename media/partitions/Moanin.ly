
\version "2.19.80"
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

title = #"Moanin'"
composer = #"Bobby Timmons"
meter = #"(Med. Gospel)"
kwtempo = #"Medium"
kwstyle = #"Gospel"

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
s1 f2:m6 as:7 g:9- c:9+ f2:m6 as:7 g:9- c:9+ f2:m6 as:7 g:9- c:9+
f2:m6 as:7 g:9- c:9+ f2:m6 g4:m7 gis:dim f/a bes:6 f:7/c b:9.11+
bes2:m7 as:7 g:9- c:9+ f1:m6 f2:7 f:9-
bes2:m7 as:7 g1:9- g:m5-7 c:9+
f2:m6 as:7 g:9- c:9+ f2:m6 as:7 g:9- c:9+ f2:m6 as:7 g:9- c:9+
f1*2:m6
}


theNotes =  \relative c' {
  \clef "treble" \key as \major \time 4/4
r8 f-> r f as as f c
\repeat volta 2 {
  \A
  << { r2 \startParenthesis \parenthesize bes'4. \endParenthesis \parenthesize  as8 } \\ { es4-. f2. } >>
  r8 f-> r f as4-- bes8 bes16 ces 
  << { r2 \startParenthesis \parenthesize bes4. \endParenthesis \parenthesize  as8 } \\ { bes16 as f f ~ f2. } >>
  r8 f-> r f c'4 es8 c16 ces | \break
  << { r2 \startParenthesis \parenthesize bes4. \endParenthesis \parenthesize  as8 } \\ { bes16 as f f ~ f2. } >>
  r8 f-> r f as as f c 
  
}
\alternative {
  { 
  << { r2 \startParenthesis \parenthesize bes'4. \endParenthesis \parenthesize  as8 } \\ { es4-. f2. } >>
    r8 f-> r f as as f c }
  { \set Score.voltaSpannerDuration = #(ly:make-moment 4 4)
  << { r2 \startParenthesis \parenthesize bes'4. \endParenthesis \parenthesize  as8 } \\ { es4-. f2. } >>
    r2 f4-^ f4-^ }
}
\bar "||" \break
\B
c'2 ces16 bes as f bes f as8 ~ | as4. f8 es c es f ~
f1 ~ | f4 r f4-^ f4-^ \break
c'2 ces16 bes as f bes f as8 ~ | as4. f8 as f as c ~
c2 es8 c bes c | r8 f,-> r f as as f c \break \bar "||"
  \A
  << { r2 \startParenthesis \parenthesize bes'4. \endParenthesis \parenthesize  as8 } \\ { es4-. f2. } >>
  r8 f-> r f as4-- bes8 bes16 ces 
  << { r2 \startParenthesis \parenthesize bes4. \endParenthesis \parenthesize  as8 } \\ { bes16 as f f ~ f2. } >>
  r8 f-> r f c'4 es8 c16 ces \break
  << { r2 \startParenthesis \parenthesize bes4. \endParenthesis \parenthesize  as8 } \\ { bes16 as f f ~ f2. } >>
  r8 f-> r f as as f c 
 es4-. f2. | R1 \bar ".."



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
  \bar "[|:" \/f2:m6 as:7 \/g:9- c:9+ \/f2:m6 as:7 \/g:9- c:9+ \break
  \/f2:m6 as:7 \/g:9- c:9+ 
  \set Score.repeatCommands = #'((volta "1"))
  \/f2:m6 as:7 \s g:9- c:9+ \break
   \set Score.repeatCommands = #'((volta #f) end-repeat)
   \stopStaff s1 \bar "" s \startStaff 
   \set Score.repeatCommands = #'((volta "2"))
   \wb f2:m6  g4:m7 gis:dim \x f/a bes:6 f:7/c b:11+ \bar "||"
   \set Score.repeatCommands = #'((volta #f)) \break
   \/bes2:m7 as:7 \/g:9- c:9+ f1:m6 f:9- \break
   \/bes2:m7 as:7 g1:9- g:m5-7 c:9+ \break
   \/f2:m6 as:7 \/g:9- c:9+ \/f2:m6 as:7 \/g:9- c:9+ \break
   \/f2:m6 as:7 \/g:9- c:9+ \repeat percent 2 f1:m6
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*11 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
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