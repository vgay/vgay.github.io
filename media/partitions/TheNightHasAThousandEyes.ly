
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

title = #"The Night Has a Thousand Eyes"
composer = #"B. Bernier & J. Brainin"
meter = #"(Up Latin Swing)"
kwtempo = #"(Med. Up"
kwstyle = #"Latin Swing"

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
  asplayed = #"John Coltrane" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=VZ5ebjyZ44I"
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
  s4 g1*2:7+/d d:7sus4 g:7+/d d1:7sus4 d:7
  d:m7 g:7 c:7+ f:7.11+ g:7+/d d1:7sus4 g:7+/d d1:7sus4 g:7+/d
  c:m7 f:7 bes:7+ bes:7+ bes:m7 es:7 as:7+ as:7+ 
  a:m7 d:7sus4 g:7+/d e:m7 
  g:7+/d d1:7sus4 g:7+/d d1:7sus4

}


theNotes =  \relative c'' {
  \clef "treble" \key g \major \time 4/4 
  \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \bold \fontsize #2 { \box Latin " " \box A  } 
  \partial 4 d4 \repeat volta 2 {
    a'1 ~ | a2 fis4 d8 e8 ~ | e1 ~ | e2 r8 b'4 g8 | 
    a4. a8 a8 a4 a8 ~ | a8 a4. fis4 d8 e8 ~ | e4. c8 b8 a4 d8 |d2. d4 \bar "||" \break 
    \Swing 1~ | 4 c8 b8 c8 d4 b8 ~ | b1 ~ | b2 a'4 g4 | 
    \Latin d4. d8 ~ d4 d4 ~ | d8 e8 fis8 d8 c8 fis4 g8 ~ | g1 }
  \alternative { { r2 r4 d4 } { r2 r4 g4} } \bar "||" \break 
  \mark \markup \bold \fontsize #2 { \box Swing " " \box B  } 
  bes4. bes8 ~ bes4 bes4 ~ | bes8 a8 bes8 des8 ~ des8 c4. | a1 ~ | a2 r4 a4 | 
  as4. as8 ~ as4 as4 ~ | as8 g8 as8 b8 ~ b8 bes4. | g1 ~ | 1 \break
  g2 g4. g8 ~ | g4. a8 b4 g4 | d'1 ~ |  d2 c4 b4 | \Latin
  d,2 d4. d8 ~ | d8 e8 fis8 d8 c8 fis4 g8 ~ | g1 | R1 \bar ".."
}

harmoniesV = \chordmode {
  \set chordChanges = ##t
  s4 g1*2:7+ a1:m7 d:7 g1*2:7+  a1:m7 d:7
  d:m7 g:7 c:7+ f:7.11+ g:m7 d1:7 g a2:m7 d:7 g1
  c1.:m7 f2:5+7 bes1:7+ bes:7+ bes1.:m7 es2:5+7 as1:7+ as:7+ 
  a:m7 d:7sus4 g:7+ e:m7 
  a1:m7 d:7 g g g a1:m7 d:7 g g

}


theNotesV =  \relative c' {
  \clef "treble" \key g \major \time 4/4 
  \A
  \partial 4 d4 \repeat volta 2 {
    a'4 4 4. 8 | 2 fis4. d8 | e1 ~ | e2. d4 | \break
    a'4 4 4 4 | b2. fis8 d | e4 c8 a8 d2~ |d2. d4 \bar "||" \break 
     d'1~ | d4 c8 b8 c4 d | b1 ~ | b2. a8 g | \break 
     fis4 4 4 4 | fis4 d c d | g1~ }
  \alternative { { g2. d4 } { g2. \repeatTie 4 } } \bar "||" \break 
  \B
  bes4. 8  2 ~ | 4 8 8 des4. c8 | a1 ~ | a2 f4 4 | \break
  as4 4 4 4 | 4 4 ces8 4 bes8| g1 ~ | 2.  es4 \break
  g4 4 2~ | g4 4 a4. g8 | d'1 ~ |  d2. d,8 8 | \break
  4 4 2~ | 4 fis8 d c4 d | g1~ | \Coda 2. r4 \break \bar "|."
  \Coda g2. \repeatTie d4 | 1~ | 4 fis8 d c4 d | g1~ | 2. r4
  \bar ".."
}


grille = \chordmode {
  \bar "[|:"
  \repeat percent 2 g1:7+/d \repeat percent 2 d:7sus4 \break
  \repeat percent 2 g1:7+/d \repeat percent 2 d:7sus4 \break
  d:m7 g:7 c:7+ f:7.11+ \break
  g1:7+/d d:7sus4 g1:7+/d \set Score.repeatCommands = #'((volta "1")) d:7sus4
  \set Score.repeatCommands = #'((volta #f) end-repeat) \break
  \stopStaff s \bar "" s \bar "" s \startStaff 
  \set Score.repeatCommands = #'((volta "2")) g1:7+/d 
  \set Score.repeatCommands = #'((volta #f)) \bar "||" \break
  c:m7 f:7 \repeat percent 2 bes:7+ \break
  bes:m7 es:7 \repeat percent 2 as:7+ \break
  a:m7 d:7sus4 ges:7+/d e:m7 \break
  g1:7+/d d:7sus4 g1:7+/d d:7sus4 
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \fontsize #5 { \box A " Latin" } s1*7 
  s1 ^\markup \bold \fontsize #5 Swing s1*3 
  s1 ^\markup \bold \fontsize #5 Latin s1*7 
  s1 ^\markup \bold  \fontsize #5 { \box B " Swing" } s1*11
  s1 ^\markup \bold \fontsize #5 Latin
}

verse = \lyricmode {
  Don't whis -- per things to me you don't mean
  For words deep down ins -- ide can be seen by the night
  The night has a thou -- sand eyes
  And it knows the truth a -- part from one that lies The \skip 1 \skip 1



  lived my life wal -- king through a dream
  For I knew that I would find this mo -- ment su -- preme
  A night of bliss and ten -- der sighs
  And the smi -- ling down of a thou -- sand eyes
  
  \skip 1 The night has a thou -- sand eyes
}

verseB = \lyricmode {
  \skip 1 rom -- ance may have cooled in the past
  My love for you will be e -- ver -- las -- ting and bright
  As bright as a star -- lit sky
  And the won -- drous night that has a thou -- sand eyes \skip 1 \skip 1 I've
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
  \header { arranger = "" }
  #(define output-suffix "Vocala4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmoniesV }
        \new Staff \with { instrumentName = \CleSol } 
        <<
           \theNotesV
           \addlyrics \verse
           \addlyrics \verseB
        >> 
      >>
    } %\form
  } 
}