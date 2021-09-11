
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
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"La mer (Beyond The Sea)"
composer = #"Charles Trenet"
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
    \ChordNames
    \override ParenthesesItem.font-size = #2
}}


\layout {
  \context {
    \Score
    extraNatural = ##f
    \omit BarNumber
    skipBars = ##t
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  s4 f2:6 d:m7 g:m7 c:7 f2:6 d:m7 g:m7 c:7 
  f:6 a:7/e d:m7 c:7 f:6 c4:m7 b:7 bes2:7+ d:7/a
  g:m7 c:7 d:m7 g:m7 g:7sus4 g:7 c:7sus4 c:7 
  d:m7 g:m7 g2:m7 c:7 f:6 e:7
  a:6 fis:m7 b:m7 e:7 a:6 fis:m7 b:m7 e:7 
  a:7+ as:5+7 g:7sus4 g:7
  c:6 a:m7 d:m7 g:7 c:6 a:m7 d:m7 g:7
  c:6 as:7 g:m7 c:5+7 
  f2:6 d:m7 g:m7 c:7 f2:6 d:m7 g:m7 c:7 
  f:6 a:7/e d:m7 c:7 f:6 c4:m7 b:7 bes2:7+ d:7/a
  g:m7 c:7 d:m7 g:m7
  
  
  f1:6
}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 4/4
    \partial 4 c8 f~
    \repeat volta 2 {
      \A
      f1~ | f2 \tuplet 3/2 { e4 f g } |
      a2. f8 g~ | g2 \tuplet 3/2 { e4 d c } |
      a'1~ | a2 g8 a bes c~ | 
      c4. f,8 f4 f8 d'~ | d1~ |
      d4 d \tuplet 3/2 { c a g } | \break
    }
    \alternative {
      { f2 d8 f4 g8~ | g1 | c,2. c8 f \laissezVibrer }
      { f2 d8 f4 g8~ | g1 \repeatTie | f2 r4 e8 a~ \bar "||" }
    }
        \B \break
        a1 | r8 gis4. a4 b8 cis~ | 
        cis2. a8 b~ | b2 gis8 fis e e~ |
        e1~ | e2 r4 g8 c~ | 
        c1~ | c2 b8 c d e~ |
        e2. c8 d~ | d2 b8 a g c~ |
        c1~ | c2 r4 c,8 f~ \break \bar "||"
        \A
       f1~ | f2 \tuplet 3/2 { e4 f g } |
      a2. f8 g~ | g2 \tuplet 3/2 { e4 d c } |
      a'1~ | a2 g8 a bes c~ | \break
      c4. f,8 f4 f8 d'~ | d1~ |
      d4 d \tuplet 3/2 { c a g } | f2 d8 f4 g8~ |
 
 
 g1 | f2. r4 \bar ".."
}

grille = \chordmode {
  \bar "[|:"
 \/f2:6 d:m7 \/g:m7 c:7 \/f2:6 d:m7 \/g:m7 c:7 \break
 \/ f:6 a:7/e \/d:m7 c:7 \/f:6 c:m7 \/bes:7+ d:7/a \break
 \set Score.repeatCommands = #'((volta "1"))
 \/g:m7 c:7 \set Score.repeatCommands = #'((volta #f)) \/d:m7 g:7 
 \/g:7sus4 g:7 \/ c:7sus4 c:7 \bar ":|]" \break
 \set Score.repeatCommands = #'((volta "2")) \/g:m7 c:7 \set Score.repeatCommands = #'((volta #f)) \/d:m7 g:7 
 \/g2:m7 c:7 \/f:6 e:7  \bar "||" \break
 
 \/a:6 fis:m7 \/b:m7 e:7 \/a:6 fis:m7 \/b:m7 e:7 \break
 \/a:7+ as:5+7 \/g:7sus4 g:7 \/c:6 a:m7 \/d:m7 g:7 \break
 
 
 \/c:6 a:m7 \/d:m7 g:7  \/c:6 as:7 \/g:m7 c:5+7 \bar "||" \break
  \/f2:6 d:m7 \/g:m7 c:7 \/f2:6 d:m7 \/g:m7 c:7 \break
 \/ f:6 a:7/e \/d:m7 c:7 \/f:6 c:m7 \/bes:7+ d:7/a \break
 \/g:m7 c:7 \/d:m7 g:7 \startStaff f1:6 \parenthesize fis:7
  \bar ".." }

marques = \relative c' { 
  s1  ^\markup \bold \box \fontsize #7 A s1*15
   s1 ^\markup \bold \box \fontsize #7 B s1*11
  s1 ^\markup \bold \box \fontsize #7 A
}
verse = \lyricmode {
  La mer
Qu'on voit dan -- ser le long des gol -- fes clairs
A des re -- flets d'ar -- gent
La mer
Des re -- flets chan -- geants
Sous la plui -- e

La \skip 1
"- zur" In -- fi -- ni -- e
Vo -- yez 1 Près des é -- tangs
Ces grands ro -- seaux mouil -- lés
Vo -- yez
 Ces oi -- seaux blancs
Et ces mai -- sons rouil -- lées

La mer
Les a ber -- cés
Le long des gol -- fes clairs
Et d'une chan -- son d'a -- mour
La mer
A ber -- cé mon cœur pour la vi -- e
}

verseB = \lyricmode {
 La mer Au ciel d'é -- té con -- fond
Ses blancs mou -- tons
A -- vec les anges si purs
La mer
Ber -- gè -- re "d'a -"
}

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c a \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } 
        <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
%   }   
%   \markup \pad-markup #2 " "
  } }
  \bookpart {
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
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
%   }   
%   \markup \pad-markup #2 " "
  } }
  \bookpart {
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
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
          \new Voice  \transpose c a \theNotes
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
%   }   
%   \markup \pad-markup #2 " "
  } }
  \bookpart {
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