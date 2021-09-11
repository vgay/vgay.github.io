
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
  markup-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12)
                            (minimum-distance . 8)
                            (padding . 2))
}

title = #"Manteca"
composer = #"Dizzy Gillespie"
meter = #"(Mambo 2-3)"
kwtempo = #"Fast"
kwstyle = #"Mambo 2-3"

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
    %\override Clef #'break-visibility = #'#(#f #f #f)
    %\override KeySignature #'break-visibility = #'#(#f #f #f)
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
  %      \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %                \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %     }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  bes1*4:7 bes1*4:7
  bes1*4:7
  s1 s2 s4. \startParenthesis \parenthesize bes2:7  as:7  g:9+  ges4:7+ \endParenthesis \parenthesize f4.:9+
  as1:m des:7 ges:7+ s bes:11+ es:11+ as:7+ s 
  as1:m des:7 ges:7+ fis2:m b:7 f1:m bes:9+ es:m fis2:m b:7 
  bes1*4:7
  s1 s2 s4. \startParenthesis \parenthesize bes2:7  as:7  g:9+  ges4:7+ \endParenthesis \parenthesize f4.:9+
  bes1*2:7 es4.:11+13 as:11+13 ges:7+9 b:7+9.11+ bes2:11+13
  s8 b4.:7+9.11+ 
}

codaH = \chordmode {
  \set chordChanges = ##f
  bes1*4:7 bes4.:11+13 as:11+13 ges:7+9 b:7+9.11+ bes2:11+13
  s8 b4.:7+9.11+ s2 bes1:11+13 es:9.11+
}


theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \compressFullBarRests
  \override MultiMeasureRest #'expand-limit = #3
  \showStartRepeatBar \bar "[|:" \Intro
  \repeat volta 2 { R1*4 } \break
  \repeat volta 2 { bes4 bes' r8 bes,4 bes'8 | r4. bes,8 r bes'4. }
  \mark \markup "ad lib"
  bes4 bes' r8 bes,4 bes'8 | r4. bes,8 r bes'4. \break 
  \repeat volta 2 {
    \AetS
    \repeat unfold 2 { f,4 a a8 bes4 bes8 ~ | bes a f bes r a4.} \break
    f4 a a8 bes4 bes8 ~ | bes a f bes r a4 bes8-> ~ | bes a f bes-> ~  bes a f bes-> ~ | bes a f bes r a4.->
  }
  \break \doubleMark
  \markup \bold \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } 
  \markup \bold \box \fontsize #2 B
  bes1 ~ | bes2 a4 ges | f1 ~ | f2. es4 
  e f g as | a bes c des 
  << { es1 ~ | es2. es,4 } \\ { r2 es'8 c bes as | g es e f ~ f4 es4} >> 
  \break
  es'1 ~ | es8 e4 d8 des4 ces4 
  bes2 ~ bes8 ges as a ~ | a2 ~ a8 f ges as ~ 
  as1 ~ | as8 a bes bes' ~ bes4 as8 ges ~
  ges1 R1 \break \bar "||"
  \C
  \repeat unfold 2 { f,4 a a8 bes4 bes8 ~ | bes a f bes r a4.} \break
  f4 a a8 bes4 bes8 ~ | bes a f bes r a4 bes8-> ~ | 
  bes a f bes-> ~  bes a f bes-> ~ | bes a f bes r a4.-> \break
  \D
  \repeat volta 2 { bes,4 bes' r8 bes,4 bes'8 | r4. bes,8 r bes'4. }
  \mark \markup "4X"

  \repeat volta 2 { bes4.-> 8~-> 4 4~-> }
  \alternative {
    { 8 4.-> 4-> r4 } { 8 \repeatTie 4.-> 4-> 4-> }
  }
}

codaNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \showStartRepeatBar \Coda
  \repeat volta 2 { bes4 bes' r8 bes,4 bes'8 | r4. bes,8 r bes'4. | bes4 bes' r8 bes,4 bes'8 | r4. bes,8 r bes'4. }
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \mark \markup "ad lib." \break
  \repeat volta 2 { bes4.-> 8~-> 4 4~-> }
  \alternative {
    { 8 4.-> 4-> r4 } { 8 \repeatTie 4.-> 4-> 4-> }
  }
  4-^ r4 _"dr. fill" r2 \fermata | \improvisationOn c1 \fermata \improvisationOff
  \bar ".."
}
chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}

Basse = \relative c' {
  \override Rest #'staff-position = #0
  \clef "bass" \key es \major \time 4/4
  \repeat unfold 6 { r4 r8 as bes bes as bes | r as r bes r bes,4. }
  r4 r8 as' bes bes as bes |   r as r bes r as r \improvisationOn d,~ |
  d4. 8~ 4. 8~4. 8 r8 4. \improvisationOff
  s1*16
  \repeat unfold 2 { r4 r8 as' bes bes as bes | r as r bes r bes,4. }
  r4 r8 as' bes bes as bes |   r as r bes r as r \improvisationOn d,~ |
  d4. 8~ 4. 8~4. 8 r8 4. \improvisationOff
  r4 r8 as' bes bes as bes | r as r bes r bes,4.
  \improvisationOn d4.-> 8~-> 4 4~-> | 8 4.-> 4-> r4 | 8 \repeatTie 4.-> 4-> 4-> \improvisationOff |
}

codaBasse = \relative c' {
  \clef "bass" \key es \major \time 4/4
  r4 r8 as bes bes as bes | r as r bes r bes,4.
  r4 r8 as' bes bes as bes | r as r bes r bes,4.
  \improvisationOn d4.-> 8~-> 4 4~-> | 8 4.-> 4-> r4 | 8 \repeatTie 4.-> 4-> 4-> |
  4-^ r4 r2 \fermata | 1 \fermata \improvisationOff |
}

grille = \chordmode {
  \bar "[|:"
  \/bes2:13 g:7 \/c:m7 f:7 \/d:m7 g:7 \/c:7 f:7 \break
  bes1:7 \/es2:m7 as:9 \set Score.repeatCommands = #'((volta "1"))
  \/d:m7 g:7 \s c:7 f:7 \set Score.repeatCommands = #'((volta #f) end-repeat)
  \break \stopStaff s1 \bar "" s \startStaff 
  \set Score.repeatCommands = #'((volta "2"))
  \/bes2/f f:5+7.9- bes1:6 \set Score.repeatCommands = #'((volta #f)) \break
  \bar "||" as:m9 des:9- ges:7+9 b:9.11+ \break
  bes:9 es:9 \repeat percent 2 as:7+9 \break
  as:m9 des:9- ges:7+9 \/fis2:m5-7 b:5+7.9- \break
  f1:m5-7 bes:5+7.9- c:m5-7 f:5+7.9- \break
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \with-color #red "after last solo D.S. al coda"
  \bar "[|:" \repeat percent 4 bes:7 
  \mark \markup 4x
  \bar ":|]" }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 E s1*11 
  s1 ^\markup \bold \box \fontsize #7 F s1*7 
  %   s1 ^\markup \bold \box \fontsize #7 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #5
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold \pad-around #1 "partition sur 5 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t	} 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
        \new Staff \with {  instrumentName = \CleSol  \RemoveEmptyStaves } \Basse
      >>
    } %\form
    %}  \bookpart {
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
    } 
    \score { 
      <<
        \new ChordNames \codaH
        \new Staff \new Voice \with { \consists "Pitch_squash_engraver" } \codaNotes
        \new Staff \codaBasse
      >>
      \layout {
        indent = 0\cm }
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #5
  }
  #(define output-suffix "BbTab") 
  \header { meter = \markup \with-color #red \pad-around #1 \bold "partition sur 5 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
        \new Staff \with { instrumentName = \Bb  \RemoveEmptyStaves } \Basse
      >>
    } %\form
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
    } 
    \score { 
      <<
        \new ChordNames \transpose c d \codaH
        \new Staff \new Voice \with { \consists "Pitch_squash_engraver" } \transpose c d \codaNotes
         \new Staff \codaBasse
     >>
      \layout {
        indent = 0\cm }
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #5
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \pad-around #1 \bold "partition sur 5 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t  } <<
          %\new Voice  
          \transpose c a, \theNotes
        >> 
        \new Staff \with { instrumentName = \Eb \RemoveEmptyStaves } \Basse
      >>
    } %\form
    %}  \bookpart {
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
    } 
    \score { 
      <<
        \new ChordNames \transpose c a \codaH
        \new Staff \new Voice \with { \consists "Pitch_squash_engraver" } \transpose c a, \codaNotes
        \new Staff \codaBasse
      >>
      \layout {
        indent = 0\cm }
    }
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
        \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t	} 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
        \new Staff \with { instrumentName = \CleSol  \RemoveEmptyStaves } \Basse
      >>
    } %\form
    %}  \bookpart {
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
    } 
    \score { 
      <<
        \new ChordNames \codaH
        \new Staff \new Voice \with { \consists "Pitch_squash_engraver" } \codaNotes
        \new Staff \codaBasse
      >>
      \layout {
        indent = 0\cm }
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
        \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
        \new Staff \with { instrumentName = \Bb \RemoveEmptyStaves } \Basse
      >>
    } %\form
    %}  \bookpart {
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
    } 
    \score { 
      <<
        \new ChordNames \transpose c d \codaH
        \new Staff \new Voice \with { \consists "Pitch_squash_engraver" } \transpose c d \codaNotes
        \new Staff \codaBasse
      >>
      \layout {
        indent = 0\cm }
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
        \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t  } <<
          %\new Voice  
          \transpose c a, \theNotes
        >> 
        \new Staff \with { instrumentName = \Eb \RemoveEmptyStaves } \Basse
      >>
    } %\form
    %}  \bookpart {
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
    } 
    \score { 
      <<
        \new ChordNames \transpose c a \codaH
        \new Staff \new Voice \with { \consists "Pitch_squash_engraver" } \transpose c a, \codaNotes
        \new Staff \codaBasse
      >>
      \layout {
        indent = 0\cm }
    }
} }