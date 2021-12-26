\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
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

title = #"Tin Tin Deo"
composer = #"Walter 'Gil' Fuller"
meter = #"(Med. Afro-Swing)"
kwtempo = #"Medium"
kwstyle = #"Afro Swing"

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
  asplayed = #"Dizzy Gillespie" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=LIo63Nt7XEc"
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
    %\RemoveEmptyStaves
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
    \override Glissando #'style = #'zigzag
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  f1:m7+ c:9+ f1:m7+ c:9+ c:9+
  f2:m6 es:m6 des:7+9 c:5+7.9-11+
  f:m6 d:5+7.9-11+ g:m5-7 ges:9-13
  f2:m6 es:m6 des:7+9 c:5+7.9-11+
  f:m9 bes:9 es:9 d:5+7.9-11+
  c1*2:9+ f:m7+ c1*2:9+ f:m7+ f1:m7+
  bes:m9 bes4:m9 c:7/es s4. as2:7+ des:9.11+ s8
  c2:5+7.9-11+ f:9- bes1:m9 bes4:m9 c2.:7/es as2:7+9 d:m5-7 g:5+7.9-11+ d:m5-7
  c1*2:9+ f:m7+ c1*2:9+ f:m7+ 
}

tillCue = \markup { \text \italic "Till Cue" }
onCue = \markup {  \text \italic "On Cue" }

theNotes =  \relative c'' {
  \clef "treble" \key as \major \time 4/4
  \showStartRepeatBar \bar "[|:" 
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \bold { \box Intro \tiny "Piano tacet 1st X" }
  \repeat volta 2 { 
    \improvisationOn \repeat unfold 3 { r8 b8 r4 r8 b8 r4 } }
  \alternative {
    { \set Score.repeatCommands = #(list (list 'volta tillCue))
      r8 b8 r4 r8 b8 r4  \bar ":|]" }
    { \set Score.repeatCommands = #(list (list 'volta onCue)) r8 b8 r4 \improvisationOff \tuplet 3/2 { r4 f as }  }
  }
  
  \break \repeat volta 2 { 
    \break 
    \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
    \mark \markup \bold \box Afro
    \tuplet 3/2 { c c bes } \tuplet 3/2 { c c bes } |
    c2 r8 bes c16 b bes8 | 
    \tuplet 3/2 { f4 f as } f2~ |
    f \tuplet 3/2 { r4 f as } | 
    \tuplet 3/2 { c c bes } \tuplet 3/2 { c c bes } |
    c2  bes8 c4 bes8 | 
    \tuplet 3/2 { f4 f as } f2~ |
    f \tuplet 3/2 { f4 as f } | \break
    es8 es4.~ es2 | r2 \tuplet 3/2 { es4 c es } | 
    f8 f4. ~ f2 | r2 \tuplet 3/2 { f4 as f } 
    es8 es4.~ es2 | r2 \tuplet 3/2 { es4 c es } | 
    f8 f4. ~ f2 }
  \alternative {
    { r2 \tuplet 3/2 { r4 f as } }
    { r2 r4 f } 
  } \break 
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \break \mark \markup \bold \box Swing \bar "||"
  c'4. bes8 r es4 d8 |
  c16 d c bes c4 r8 bes as g->~ |
  g bes as g->~ g f g4-> | 
  r2 _\markup "drum fill on head" r4 f | 
  c'4. bes8 r es4 d8 |
  c16 d c bes c4 \tuplet 3/2 { r bes as } |
  \tuplet 3/2 { g es f } \tuplet 3/2 { g es f } |
  g r \tuplet 3/2 { f c f } \break 
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \bold \box Afro \bar "||"
  es8 es4.~ es2 | r2 \tuplet 3/2 { es4 c es } | 
  f8 f4. ~ f2 | r2 \tuplet 3/2 { f4 as f } 
  es8 es4.~ es2 | r2 \tuplet 3/2 { es4 c es } | 
  f8 f4. ~ f2 | 
  r2 \tuplet 3/2 { \startParenthesis \parenthesize r4 f \endParenthesis \parenthesize as }
  \bar ".."
}
Basse = \relative c {
  \clef "bass" \key as \major
  f4 c'8 d e4 d8 c | c,4 g'8 bes c es des c | f,4 c'8 d e4 d8 c | c,4 g'8 bes c es des c | c,4 g'8 bes c es des c
  f,2 es4 bes' | des2 g,4 c | f,2 d4 d  | g2 ges |
  f2 es4 bes' | des2 g,4 c | f,2 bes4 f | es2 d
  \repeat percent 2 { c4 g'8 bes c es des c } \repeat percent 2 { f,4 c'8 d e4 d8 c } 
  \repeat percent 2 { c,4 g'8 bes c es des c } \repeat percent 2 { f,4 c'8 d e4 d8 c } 
  f,4 c'8 d e4 d8 c
  bes,2 bes'4 es,~ | es2 bes4 es | as4. des,8~ des4 des-> | R1 |
  bes2 bes' | es, es | as d, | g4 r d2
  \repeat percent 2 { c,4 g'8 bes c es des c } \repeat percent 2 { f,4 c'8 d e4 d8 c } 
  \repeat percent 2 { c,4 g'8 bes c es des c } \repeat percent 2 { f,4 c'8 d e4 d8 c }}


grille = \chordmode {
  \bar "[|:"
  f1:m7+9 c:9+ f1:m7+9 c:9+ \bar ":|][|:" \break
  \/ f2:m6 es:m6 \/ des:7+9 c:5+7.9-11+
  \/ f:m6 d:5+7.9-11+ \/ g:m5-7 ges:9-13 \break
  \/ f2:m6 es:m6 \/ des:7+9 c:5+7.9-11+
  \/ f:m9 bes:9 \/ es:9 d:5+7.9-11+ \break \startStaff
  \repeat percent 2 c1:9+ \repeat percent 2 f:m7+ 
  \repeat percent 2 c1:9+ \repeat percent 2 f:m7+ \bar ":|]" \break
  b1:m9 \/ b2:m9 c:7/es \/  as:7+ des:9.11+ \/ c:5+7.9-11+ f:9- \break \startStaff
  b1:m9 \/ b2:m9 c:7/es \/  as:7+9 d:m5-7 \/ g:5+7.9-11+  d:m5-7 \break \startStaff
  \repeat percent 2 c1:9+ \repeat percent 2 f:m7+ \break
  \repeat percent 2 c1:9+ \repeat percent 2 f:m7+
  \bar ".." }

marques = \relative c' { 
  s1  ^\markup \bold \box \fontsize #5 Intro s1*3 
  s1  ^\markup \bold \box \fontsize #5 Afro s1*15 
  s1 ^\markup \bold \box \fontsize #5 Swing s1*7 
  s1  ^\markup \bold \box \fontsize #5 Afro
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \header { meter = \markup \with-color #red "Partitions sur 2 pages" }
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
        >> 
        \new Staff \with { \RemoveEmptyStaves } \Basse
      >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \header { meter = \markup \with-color #red "Partitions sur 2 pages" }
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
      >>        \new Staff \with { \RemoveEmptyStaves } \Basse
>>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \header { meter = \markup \with-color #red "Partitions sur 2 pages" }
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
      >>        \new Staff \with { \RemoveEmptyStaves } \Basse
>>
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
      >>        \new Staff \with { \RemoveEmptyStaves } \Basse
>>
  } }
    \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
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
      >>        \new Staff \with { \RemoveEmptyStaves } \Basse
>>

  } }
    \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
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
      >>       \new Staff \with { \RemoveEmptyStaves } \Basse
 >>
  }  } 
    \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
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
        }
        \transpose c a \grille
      >>
} } }

%{
convert-ly (GNU LilyPond) 2.22.1  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
