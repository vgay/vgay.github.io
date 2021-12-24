
\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"

#(let ((default-number-format number-format))
   (set! number-format
         (lambda (number-type num . custom-format)
           (if (eq? number-type 'circled)
               (make-circle-markup (number->string num))
               (apply default-number-format number-type num custom-format)))))



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

voltaII = \markup { 2.3.}

title = #"L'eau à la bouche"
composer = #"Serge Gainsbourg"
meter = #"(Samba)"
kwtempo = #"Fast"
kwstyle = #"Samba"

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
  arranger = "Arr. Vincent Gay"
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
    \override MultiMeasureRest #'expand-limit = #3
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
  \context { \Score markFormatter = #format-mark-box-alphabet 
  }
  %  \context { \RemoveEmptyStaffContext 				
  
  % ne pas imprimer les lignes vides (autres que la première)
  %\override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  % }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  bes1:7+ bes:5+7+  g:m1.3-.5.9/bes bes:5+7+
  bes1:7+ bes:5+7+  g:m1.3-.5.9/bes bes:5+7+
  g:m7 s s s
  c:m7 f:7 bes:7+ g:m7
  c:m7 f:7 es:6 f:7 es2:6 f:7 bes1:7+
  bes1:7+ f:7/c bes1:7+ c:m7 
  g:m7 a:m5-7 bes1:7+ g:m7
  f:7 s bes:7+ s a:7 s f2:7 es:6.9 d:m7 c:m7

  es:m6- f:7
  bes1:7+ bes:5+7+  g:m1.3-.5.9/bes bes:5+7+
  bes1:7+ bes:5+7+  g:m1.3-.5.9/bes bes:5+7+
  bes:7+

}


theNotes =  \relative c'' {
  \clef "treble" \key bes \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \mark \markup { \box \bold Intro}
  \repeat volta 2 {
    R1*4 \break
  }
  \once \override Score.RehearsalMark.extra-offset = #'(-1 . -1.5)
  \mark \markup { \with-color #red \bold \larger \musicglyph "scripts.varsegno" \raise #-1 \box \bold "A"}
  \repeat volta 2 {
    d4  d   d8   d4  d8~  | % 8
    d2.  d4 | % 9
    d4  d  f8  es4  d8~ | 
    d4  c2. | 
    bes4  bes   bes8   bes4  bes8 ~ | % 12
    bes2.  bes4 | % 13
    bes4  bes  d8  c4  bes8~ | % 14
    bes4  a2. | \break
    g4  bes  es  a, ~ | % 16
    a4  c  g'  f | % 17
    f2.  d4 ~ | % 18
    d1 | 
    g,4  bes  es  a,~ |
    a2  g'4 f 
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \once \override Score.RehearsalMark.extra-offset = #'(-1 . -2)
    \mark \markup \with-color #red \center-column { "To Coda" \smaller "2nd X" }
  }
  \alternative { 
    { bes,2.  c4 ~ | c1 } 
    { \overrideProperty Score.VoltaBracket.text \voltaII
      bes2( c2)| bes1 }
  } \break \bar "||" 
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup \with-color #red fine
  \markup \bold \box B
  f'8  bes4  a  g  f8 ~ | % 24
  f4  f2  es4 | % 25
  f1 ~ | % 26
  f4 r \times 2/3 {
    g4  f  es
  }
  | % 27
  d4  g  f  es | % 28
  d4  d2  c4 | % 29
  d1 |
  r2 \tuplet 3/2 { es4 d es } | \break
  f1 | % 32
  r2 \tuplet 3/2 { c4 f c } |
  d1 | % 34
  r2 \times 2/3 {
    f4  f  g
  }
  a1 | % 36
  r4  e  es  e | % 37
  a2  g | % 38
  f2  es \bar ":|]" \break
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark 
  \markup \with-color #red "To Fine"
  \markup \with-color #red \bold \larger \musicglyph "scripts.varcoda"

  bes1 | c | | bes~ | bes~ | bes2 r | \break R1*6 \bar ".."
}

chordsRhythm = \relative c' {
  \key bes \major \time 4/4
  <f bes d a'>4 q q8 q4 <fis bes d a'>8~ |
  q q4 q8 q4 q
  <g bes d a'>4 q q8 q4 <fis bes d a'>8~ |
  \once \override Score.RehearsalMark.extra-offset = #'(14 . 9)
  \once \override Score.RehearsalMark #'direction = #DOWN
  \mark \markup \with-color #red "Guit. continue sim."
  q q4 q8 q4 q |  
  %     s1*18
  %     <bes, f' a d f>1 <c f c' es a>  <bes f' a d f> <c g' bes es g>2 q |
  %     <f bes d g>1  <es a c g'> <bes f' a d f> <f' bes d g>4. 8~ 2 
  
} 

Frets = \relative c {
  \override FretBoard.fret-diagram-details.number-type = #'circled
  \override FretBoard.fret-diagram-details.label-dir = #LEFT
  \override FretBoard.fret-diagram-details.fret-label-font-mag = #0.5
  \override FretBoard.fret-diagram-details.finger-code = #'none
  \override FretBoard.fret-diagram-details.barre-type = #'straight
  <f-1 bes-1 d-1 a'-2>1 <fis bes d a'> <g bes d a'> <fis bes d a'>
}

Rhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  s1*22 
  \once \override TextScript #'extra-offset = #'( -8 . -2 ) 
  d1 ^\markup \teeny { guit. rhythm }
  1 1 2 2 1 1 1 4. 8~ 2
}


Basse = \relative c' {
  \revert Score.Clef #'break-visibility
  \clef "bass" \key bes \major \time 4/4
  \override Rest #'staff-position = #0
  \showStartRepeatBar \bar "[|:"
  \mark \markup { \box \bold Intro}
  \oneVoice
  \repeat volta 2 {
    \repeat unfold 4 { bes4. 8 2  } 
  } \break
  \once \override Score.RehearsalMark.extra-offset = #'(-2 . -1)
  \mark \markup { \with-color #red \bold \larger \musicglyph "scripts.varsegno" \raise #-1 \box \bold "A"}
  \repeat volta 2 { 
    \repeat unfold 4 { bes4. 8 2  } 
    \repeat unfold 4 { g2 d  } \break 
    c4. es8 g2 | f c | bes4. d8 f2 | g d | \break
    c4. es8 g2 | f c | 
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \once \override Score.RehearsalMark.extra-offset = #'(-1 . -2)
    \mark \markup \with-color #red \center-column { "To Coda" \smaller "2nd X" }

  }
  \alternative {
    { es4 4 8 4 f8~ | 8 4 8 4 4 }
    { es4 4 f8 4 bes8~ | 4. 8~ 2 }
  }
  \break \bar "||"
  \once \override Score.RehearsalMark.extra-offset = #'(-2 . -2)
  \mark #2 
  bes,1 | 
  \once \override Score.RehearsalMark.extra-offset = #'(-2 . 0)
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \with-color #red "Half Time Feel"

  c | d | \stemDown c2 g | a1 | g | bes4. 8~ 4 a | g4. d'8~ 2 | \break \stemNeutral
  \once \override Score.RehearsalMark.extra-offset = #'(0 . 1)
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \mark \markup \with-color #red "Back to common Time"
  \oneVoice f4. c8~ 4. f,8~ | 2. f'4 |
  \repeat unfold 2 { bes4. 8 2  } \repeat unfold 2 { a4. 8 2  } 
  f2 es | d c \bar "||" \break 
  \bar "|."
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark 
  \markup \with-color #red "D.S. al Coda"
  \markup \with-color #red \bold \larger \musicglyph "scripts.varcoda"
  es4 4 8 4 f8~ | 8 4 8 f,4 c' 
  \repeat unfold 3 { bes4. 8 2  } \break \repeat unfold 5 { bes4. 8 2  } bes1
  \fermata \bar ".."
}

grille = \chordmode {
  \bar "[|:"
  bes1:7+ bes:5+7+ g:1.3-5.9 bes:5+7+ \break
  \repeat percent 4 g:m7 \break
  c:m7 f:7 bes:7+ g:m7 \break
  c:m7 f:7\set Score.repeatCommands = #'((volta "1"))
  es:6 f:7   \set Score.repeatCommands = #'((volta #f) end-repeat) \break
  \stopStaff s \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2"))
   \Coda 
  \/es2:6 f:7 bes1:7+  \set Score.repeatCommands = #'((volta #f)) \break
  \bar "||"
  bes:7+ f:7/c bes:7+ c:m7 \break
  g:m7 a:m5-7 bes:7+ g:m7 \break
  \repeat percent 2 f:7 \repeat percent 2 bes:7+ \break
  \repeat percent 2 a:7 \/f2:7 es:6.9 \/d:m7 c:m7 \bar "||-[|:"
  
  \Coda \repeat volta 2 { bes1:7+ bes:5+7+ g:1.3-5.9 bes:5+7+ }
 
   }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*15 
  s1 ^\markup \bold \box \fontsize #7 B 
}

verse = \lyricmode {
É -- cou -- te ma voix, é -- cou -- te ma pri -- è -- re
É -- cou -- te mon cœur qui bat, lais -- se -- toi fai -- re
Je t'en prie ne sois pas fa -- rou -- che
Quand me vient l'eau à la bou -- che --
\repeat unfold 2 { \skip 1 }

Lais -- se toi au gré du cou -- rant
\repeat unfold 3 { \skip 1 } Por -- ter dans le lit du tor -- rent
Et dans le mien
Si tu veux bien
Quit -- tons la rive
Par -- tons à la dé -- ri -- ve 
}
verseB = \lyricmode {
Je te veux con -- fiante, \skip 1 je te sens cap -- ti -- ve
Je te veux do -- cile, \skip 1 je te sens crain -- ti -- ve
Je t'en prie, ne sois pas fa -- rou -- che
Quand me vient l'eau à la \repeat unfold 2 { \skip 1 }
bou -- che  
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
          \new FretBoards  
          {
            
            \Frets
          }
          \new Staff \with { instrumentName = "Guit." } \chordsRhythm
          %\new TabStaff \transpose c c, \chordsRhythm
        >>
        \new Staff \with { instrumentName = "bass" } 
        << 
          \new Voice { \voiceTwo \Basse }
          \new Voice { \voiceOne\Rhythm }
        >>
      >>
    } 
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
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "RSTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup 
        <<
          \new FretBoards  
          {
            
            \Frets
          }
          \new Staff \with { instrumentName = "Guit." } \chordsRhythm
          %\new TabStaff \transpose c c, \chordsRhythm
        >>
        \new Staff \with { instrumentName = "bass" } 
        << 
          \new Voice { \voiceTwo \Basse }
          \new Voice { \voiceOne\Rhythm }
        >>
      >>
    } 
  } 
}

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Vocala4")
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
        >> 
      >>
    } 
        \markup {
      \vspace #5
      \fill-line {
        \hspace #1
        \column {
          \line { Je te prendrai doucement et sans contrainte }
          \line { De quoi as-tu peur ? allons, n'aie nulle crainte }
          \line { Je t'en prie, ne sois pas farouche  }
          \line {Quand me vient l'eau à la bouche   }
        }
        \hspace #2
        \column {
          \line { Cette nuit près de moi tu viendras t'étendre }
          \line { Oui, je serai calme, je saurai t'attendre }
          \line { Et pour que tu ne t'effarouches }
          \line { Vois, je ne prends que ta bouche }
          \hspace #2
        }
        \hspace #2

         }
    }
  }
}