
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

title = #"Nigerian Marketplace"
composer = #"Oscar Peterson"
meter = #"(Med. Latin)"
kwtempo = #"Medium"
kwstyle = #"Latin"


form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

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
  asplayed = #"Oscar Peterson"
  url = #"https://www.youtube.com/watch?v=aT22bCkKmTk"
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
}


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
  \set chordChanges = ##t
  a1*4:m9 g:m9 f1*3:m9 e1:9.11+ es1*5:9.11+
  as4:m11 bes:m7 ces2:7+ as4:m11 bes:m7 ces2:7+ 
  es8:7+\startParenthesis \parenthesize  f4:m7 es:7+/g \endParenthesis \parenthesize  es:7+ g8:8 s2 ges:13
  f8:m7 \startParenthesis \parenthesize g4:m7 as:7+ \endParenthesis \parenthesize  a:m5-7 
  bes8:9sus4 s2 bes:9-13 es1*3:7+
  a1*4:m9 g:m9 f1*3:m9 e1:9.11+ es1*4:9.11+  
  
}

IntroP =  \relative c' {
  \clef "bass" \key c \major \time 4/4
  \repeat percent 4 { 
    << { r4 b8 c~ c <c e b'>4. } \\
       { a,8~ <a e'>~ q2~ q8 e' } >>
  }
}

theNotes =  \relative c'' {
  \clef "treble" \key c \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 { \A
                    \tuplet 3/2 { b4 d c } e,2~ | 2 r8 e g a |
                    b16 ais b8 g16 fis g8 e16 d e8 c16 b c8 | a b c e,~ 4 r | \break
                    \tuplet 3/2 { a'4 c bes } d,2~ | 1 |
                    a'16 bes c8-. g16 a bes g f g a8-. d,16 e f8-. | a8 bes c d, a' g~ 4 | \break
                    \tuplet 3/2 { g bes as } c,2 | d,16 es f g as bes c d es f g as bes c d es | 
                    \tuplet 3/2 { f2 es4 } d c | cis b ais gis |
                    a!4. c16 bes a2\startTrillSpan | r8\stopTrillSpan a c bes a2\startTrillSpan |
                    r8\stopTrillSpan a r c16 bes a2~\startTrillSpan }
  \alternative {
    { 2. r8 \stopTrillSpan a16 ais  }
    { a2\prallprall \repeatTie r8 es( ges bes) \break }
  }
  \repeat volta 2 { \mark \markup { \with-color #red \bold \larger \musicglyph "scripts.varsegno" \box \bold \fontsize #2 "B"}
                    des4 bes8-- 8-^ r es,-. ges-. bes-. | des4 bes8-- 8-^ r es,( ges bes) |
                    g!8 as4 bes8~ 8 c4 des8~ | 4. bes8~ 2 |
                    c,8 d4 es8~ 8 g4 bes8~ | 2 g | 
                    \comp #4
  }
  \alternative {
    { \comp #2 r8 es( ges bes) }
    { \comp #4 \break }
  }
  \A  \tuplet 3/2 { b4 d c } e,2~ | 2 r8 e g a |
  b16 ais b8 g16 fis g8 e16 d e8 c16 b c8 | a b c e,~ 4 r | \break
  \tuplet 3/2 { a'4 c bes } d,2~ | 1 |
  a'16 bes c8-. g16 a bes g f g a8-. d,16 e f8-. | a8 bes c d, a' g~ 4 | \break
  \tuplet 3/2 { g bes as } c,2 | d,16 es f g as bes c d es f g as bes c d es | 
  \tuplet 3/2 { f2 es4 } d c | cis b ais gis | \break
  a!4. c16 bes a2\startTrillSpan | r8\stopTrillSpan a c bes a2\startTrillSpan |
  r8\stopTrillSpan a r c16 bes a2~\startTrillSpan
  2. \stopTrillSpan r4 
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \bold \italic \with-color #red Fine
  \bar ".."
}

grille = \chordmode {
  \bar "[|:"
  \repeat percent 4 a1:m9 \break
  \repeat percent 4 g:m9 \break
  \repeat percent 3 f:m9 e:9.11+ \break
  \repeat percent 4 es:9.11+ \break \bar ":|][|:"
  \repeat percent 2 as:m9 es:7+ \/g2:m7 c:5+7 \break
  f1:m9 bes:13 \repeat percent 2 es:7+ \break \bar ":|]"
  \repeat percent 4 a:m9 \break
  \repeat percent 4 g:m9 \break
  \repeat percent 3 f:m9 e:9.11+ \break
  \repeat percent 4 es:9.11+  
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*15 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
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
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  #(define output-suffix "BbTab") 
  \bookpart {
    \score { <<
      \new ChordNames { \chordmode { \set chordChanges = ##t a1:m9 } }
      \new Staff \with { instrumentName = \markup { \column { "Intro" \line { "piano"} } } }
      \IntroP
    >> }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
      >> >>
} } }

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
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score { <<
      \new ChordNames { \chordmode { \set chordChanges = ##t a1:m9 } }
      \new Staff \with { instrumentName = \markup { \column { "Intro" \line { "piano"} } } }
      \IntroP
    >> }
    \score {
      <<
        \new ChordNames {
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
      >> >>
      %   }   \markup \pad-markup #2 " "
    }  \form
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
    \score { <<
      \new ChordNames { \chordmode { \set chordChanges = ##t a1:m9 } }
      \new Staff \with { instrumentName = \markup { \column { "Intro" \line { "piano"} } } }
      \IntroP
    >> }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
      >> >>
      %   }   \markup \pad-markup #2 " "
  } }  \bookpart {
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
    \score { <<
      \new ChordNames { \chordmode { \set chordChanges = ##t a1:m9 } }
      \new Staff \with { instrumentName = \markup { \column { "Intro" \line { "piano"} } } }
      \IntroP
    >> }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
      >> >>
      %   }   \markup \pad-markup #2 " "
  } }  \bookpart {
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