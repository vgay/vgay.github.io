
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
                             (minimum-distance . 6)
                             (padding . 0))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 8)
                            (padding . 1))
}

title = #"Black Nile"
composer = #"Wayne Shorter"
meter = #"(Med. Up Swing)"
kwtempo = #"Med. Up"
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
  asplayed = #"Wayne Shorter" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=IWvUJlKp8HQ"
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
  \set chordChanges = ##f
f1:m9 ges:7+ es2..:m7 f2:m7 d:m7 s8 bes1:13 es:7+9 e2:m5-7 s8 a4.:7.5+9+ s1
d1:m6 es:9 d:m6 c2:m7 f:5+7.9- bes1:7+
a:5+7 d:m6 es:9 g2:m7 c:9sus4 a1:7.5+9+ as:13
g1:m7.11  c:13 f2:m7 bes:7 es2:7+ s es2:7+ a:5+7.9+
d1:m6 es:9 d:m6 c2:m7 f:5+7.9- bes1:7+
a:5+7 d:m6 es:9
 a:5+7.9+ d:m6  a:5+7.9+ d:m6 
}


theNotes =  \relative c''' {
  \clef "treble" \key f \major \time 4/4
\Intro
r8 g4.-> c,2 | f4.-> bes,8 ~ bes2  | des4-. des8( c) des es4 c8 ~ | c bes4 a8 ~ a f4.
r8 g'4.-> c,2 | f4.-> bes,8 ~ bes2  | 
<< { bes4-. bes8( a bes c4.) ~ | c1 } \\ { ges4 ges8 f ges f4.~ | f1 } >> \break

\repeat volta 2 {
  \A
  a1 ~ | a4 bes8 a bes c4.->| a1 ~ | a4 bes8 a bes des4.-> \break
  a4. d,8 ~ d4. a'16( bes) 
}
\alternative {
  {
    a4-- g-. f-- d8( f) ~ | f1 ~ | f2~ f8 g4.
  }
  {
    a4-- g-. f-- d8 c ~ | 
  }
}
c1 ~ | c2 ~ c8 << { d'4. } \\ { bes4. } >> \break \bar  "||-[|:"
\B
<< { 
  \repeat volta 2 { c2 ~ c8 d4. | c2 ~ c8 d4. | c4 c8 bes c bes4. | }
   \alternative {
       { g2 ~ g8 d'4. }
       { g,2 c2 \bar "||" \break }      
   } }
   \\
   { 
   \repeat volta 2 { a2 ~ a8 bes4. | a2 ~ a8 bes4. | as4 as8 g as g4. | }
   \alternative {
     { d2 ~ d8 bes'4. }
     { d,2 c'2 }
   } }
>>
  \A a1 ~ | a4 bes8 a bes c4.-> | a1 ~ | a4 bes8 a bes d4.->
  a4. d,8 ~ d4. a'16 bes | a4-- g-. f-- d8 f~ | f1 ~ \Coda| f1 \break \bar  "|."
  \Coda f\repeatTie ~ f~ f~ f ^\markup " "
  \bar ".."
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
  f1:m9 ges:7+ es:m7 \/f2:m7 d:m7 \break
  bes1:13 es:7+9 \/e2:m5-7 a:5+7.9+ a1:5+7.9+  \break
  \bar "[|:"
 d1:m6 es:9 d:m6 \/c2:m7 f:5-7.9+ \break
 bes1:7+ \set Score.repeatCommands = #'((volta "1")) a:5+7 
 \set Score.repeatCommands = #'((volta #f)) d:m6 es:9 \bar ":|]" \break
 \stopStaff s1 \startStaff \set Score.repeatCommands = #'((volta "2")) \/g2:m7 c:9sus4
 \set Score.repeatCommands = #'((volta #f)) a1:5+7.9+ as:13 \break \bar "[|:"
 g1:m7.11  c:13 \/f2:m7 bes:7 \set Score.repeatCommands = #'((volta "1")) es1:7+
   \set Score.repeatCommands = #'((volta #f) end-repeat) \break
 \stopStaff s1 \bar "" s1 \bar "" s1 \startStaff \/es2:7+ a:5+7.9+ \break
 d1:m6 es:9 d:m6 \/c2:m7 f:5-7.9+ \break
 bes1:7+ a:5+7 d:m6 \Coda es:9 \bar "|." \break
  a:5+7.9+ d:m6  a:5+7.9+ d:m6
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #5 Intro s1*7 
  s1 ^\markup \bold \box \fontsize #5 A s1*11 
  s1 ^\markup \bold \box \fontsize #5 B s1*7 
  s1 ^\markup \bold \box \fontsize #5 A
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