
\version "2.20.0"
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
}

title = #"Breakfast Wine"
composer = #"Randy Aldcroft"
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
  asplayed = #"Bobby Shew" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=sNlNoqxGOLo"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  %poet = "(code source lilypond encapsulé dans le PDF)"
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

\defineBarLine "||-[|:" #'("||" "[|:" "[|:") 

% accords intro
IntroH  = \chordmode {
  \set chordChanges = ##f s8
  \repeat unfold 2 { s2 bes4. es8:m6/bes s1 }
}

% ligne de basse pour l'intro
IntroB = \relative c {
  \clef "bass" \key bes \major \time 4/4
  \override Rest #'staff-position = #0
  \partial 8 f8( 
  \repeat volta 2 { 
    \once \override TextScript #'extra-offset = #'( -8 . 0 ) 
    bes,1) ~ _\markup "(pn. w/ bass)" | 2.. f'8( | bes,1) ~ | 2.. f'8
    \break
} }

% voicing piano intro
IntroP = \relative c'' {
  %\clef "bass" \key bes \major \time 4/4
  \override Rest #'staff-position = #7
  \partial 8 s8
  r2 <f,, bes d>4 r8 <ges bes c es>8~ | 
  q1 | 
  r2 <f bes d>4 r8 <ges bes c es>8~ | 
  q1 
}


% accords Thème
harmonies = \chordmode {
  \set chordChanges = ##f
 \parenthesize bes2 bes4. es8:m6/bes s1
  \repeat unfold 3 { s2 bes4. es8:m6/bes s1 }
  s2 bes4. es8:m6/bes |
  s2 es:m6/a | 
  g1:m7 | 
  s8 bes2.:7+9/f es8:7+ |
  s2 es4. as8:m6/es  |
  s1 |
  s2 es4. as8:m6/es  |
  s1  |
  s2 es4. g8:13  |
  s2 g:5+7 |
  c1:m7  |
  es:7+9/bes  |
  a:m5-7  |
  d:9+  |
  g:m7  |
  g:m7/f  |
  e:m5-7 |
  a:9+ |
  d2.:m7 es4:7+9.11+  |
  s1  |
  d2.:m7 es4:7+9.11+ |
  s1 |
  d2.:m7 g4:13  |
  s2 s8 g4.:5+7  |
  c1*2:9sus4  |
  f:9sus4
  s2 es4. g8:5+7  |
  s1 |
  c:m7  |
  c:m7/bes  |
  a:m5-7  |
  d:5+7.9+  |
  g:m11  |
  g:m11/f |
  c:9/e  |
  es:m6
  d:m7  |
  g:5+7  |
  c:m7.11  |
  f:13 
}

% le thème
theNotes =  \relative c' {
  \clef "treble" \key bes \major \time 4/4
  \override Rest #'staff-position = #0
  \override MultiMeasureRest #'expand-limit = #3
  \showStartRepeatBar \bar "[|:" 
  \A
  \repeat volta 3 {
    d4 es8 f~ 2~ | 1~ | 1~ | 4. ges8 f4 es-. |
    d c8 bes~ 2~| 1~ | 1~ | 2. r4 \break
    d4 es8 f~ 2~ | 1 | \stemUp g4 a8 bes^~ 2~ | \stemDown 8 c4.-> a4-. f8 g~ |
    1~ | 1~ | }
  \alternative { 
    { 1~ | 
      2. r4 \break 
    }   
    { g1~ \repeatTie | 
      2. r4   \set Score.repeatCommands = #'((volta #f)) \bar "||" \B
      c4 d8 es~ 2~ | 
      8 f4.-> d4-. bes8 c8~ | 
      1~ | 
      1 |
      bes4 c8 d~ 2~ | 
      8 bes4.-> g4-.  d8 e~ | 
      1~ | 
      2. r4 \break
      \repeat unfold 2 { f4 g8 a~ 2~ | 2 r8 g4.-> }
      f4 g8 a~ 2~ | 
      4 b~ 8 g4.-> | 
      c1~ | 
      1~ | 
      1~ | 
      2. r4  \break 
    }
    { g1~ \repeatTie | 
      2. r4 \bar "||" 
    } 
  }
  \C c4 d8 ^\markup \with-color #red \fontsize #6 \bold \eyeglasses es~ 2~ | 
  1~ | 
  1 | 
  r8 f4.-> d4-. bes8 c~ | 
  1~ | 
  1~ | 
  1 | 
  r8 d4.-> bes4-. ges8 f~ | \break
  1~ | 
  1~ | 
  1~ | 
  2. r4 \toCoda
}

% indications rythmiques thème
Rythme=  \relative c''' {
  \improvisationOn
  \override NoteHead.no-ledgers = ##t % pas de lignes additionelles
  \override Rest #'staff-position = #7 % position des silences
  \repeat unfold 4 {r2 b4-. r8 b~ | 1 }
  r2 b4-. r8 b~ | 
  2 2 \improvisationOff \stemDown
  \once \override TextScript #'extra-offset = #'( -4 . 4 ) 
  bes,,4 _\markup "(pn.)" c8 d_~ 2 | 
  \improvisationOn \stemUp r8 b''4. 4-. 8 8 \laissezVibrer | 
  \comp 2 4-. r8 b~ | 
  1 |
  r2 b4-. r8 b~ | 
  1 | 
  r2 b4-. r8 b~ | 
  4 \comp 3
  s1*8 |
  b2. b4~ | 
  1 |  
  b2. b4~ | 
  1 | 
  b2. b4 \laissezVibrer | 
  s1*5 |
  r2 b4-. r8 b~ | 
  1 |
  s1*12 
}


% accords fin du thème
EndH  = \chordmode {
  \set chordChanges = ##f
  \repeat unfold 2 { s2 bes4. es8:m6/bes | s1 }
}

% ligne de basse fin du thème
EndB = \relative c {
  \clef "bass" \key bes \major \time 4/4
  \showStartRepeatBar \bar "[|:" 
  \override Rest #'staff-position = #0
  \repeat volta 2 { 
    \once \override TextScript #'extra-offset = #'( -10 . 0 ) 
    bes1 ~ _\markup "(pn. w/ bass)" | 
    2.. f'8( | 
    bes,1) ~ | 
    2.. f'8
  } 
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup "Après Solo AABAC D.S. al Coda"
}

% voicing piano fin du thème
EndP = \relative c'' {
  \clef "bass" \key bes \major \time 4/4
  \override Rest #'staff-position = #7
  r2 <f,, bes d>4 r8 <ges bes c es>8~ | 
  q1 | 
  r2 <f bes d>4 r8 <ges bes c es>8~ | 
  q1 |  
}

% accords coda
CodaH  = \chordmode {
  \set chordChanges = ##f
  \repeat unfold 2 { s2 bes4. es8:m6/bes s1 }
}

% ligne de basse coda
CodaB = \relative c {
  \clef "bass" \key bes \major \time 4/4
  \showStartRepeatBar \bar "[|:" 
  \override Rest #'staff-position = #0
  \Coda
  \repeat volta 2 { 
    \once \override TextScript #'extra-offset = #'( -10 . 0 ) 
    bes1 ~ _\markup "(pn. w/ bass)" | 
    2.. f'8( | 
    bes,1) ~ | 
    2.. f'8
  } 
  bes,1 ~ | 
  2.. f'8( | 
  bes,1) ~ | 
  1 \fermata | 
  \improvisationOn d1 ^\fermata
}

% voicing piano coda
CodaP = \relative c'' {
  \clef "bass" \key bes \major \time 4/4
  \override Rest #'staff-position = #7
  r2 <f,, bes d>4 r8 <ges bes c es>8~ | 
  q1 | 
  r2 <f bes d>4 r8 <ges bes c es>8~ | 
  q1 |
  r2 <f bes d>4 r8 <ges bes c es>8~ | 
  q1 |
  2 <f bes d>4 r8 <ges bes c es>8~ | 
  q1 \fermata | 
  s
}

grille = \chordmode {

 \bar "[|:"
 bes1 es:m6/bes bes  es:m6/bes \break
 bes1 es:m6/bes bes  es:m6/bes \break
 bes1 \/es2:m6/bes es:m6/a g1:m7 bes:7+9/f \break
 \/es2:7+ es as1:m6/es \/as2:m6/es es 
 \set Score.repeatCommands = #'((volta "1"))
 as1:m6/es 
 \set Score.repeatCommands = #'((volta #f))  \bar ":|]" \break
 \stopStaff s1 \bar "" s1 \bar "" s1 \startStaff
 \set Score.repeatCommands = #'((volta "2")) 
 \/g2:13 g:5+7
 \set Score.repeatCommands = #'((volta #f))  \bar "||" \break
 c1:m7 es:7+9/bes a:m5-7 d:9+ \break
 g:m7 g:m7/f e:m5-7 a:9+ \break 
 d:m7 es:7+9.11+ d:m7 es:7+9.11+ \break 
 d:m7 \/g2:13 g:5+7  \repeat percent 2 c1:9sus4 \break
 \repeat percent 2 f1:9sus4 \bar ":|]" \stopStaff s1 \bar "" s1  \bar "" 
 s1 \bar "" s1 \bar "" s1 \startStaff
 \set Score.repeatCommands = #'((volta "3")) 
 g:5+7
 \set Score.repeatCommands = #'((volta #f))  \bar "||" \break
 c:m7 c:m7/bes a:m5-7 d:5+7.9+ \pageBreak
 g:m11 g:m11/f c:9/e es:m6 \break
 d:m7 g:5+7 c:m7.11 f:13 \break \bar "||-[|:"
 \repeat volta 2 {
   bes es:m6/bes bes es:m6/bes }
  %\bar ".."
}

marques = \relative c' { 
   s1 ^\markup \bold \box \fontsize #7 A s1*19 
  s1 ^\markup \bold \box \fontsize #7 B s1*23 
  s1 ^\markup \bold \box \fontsize #7 C s1*11
  s1 ^\markup \bold \box \fontsize #7 Interlude
}



% partition pour instrument en do format tablette
\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \header { meter = \markup \with-color #red "Partition sur 2 pages" }
  #(define output-suffix "CTab")
  \bookpart {
    \score { <<
      \new ChordNames { \set chordChanges = ##t \IntroH }
      \new Staff \with { instrumentName = \CleSol } 
      << \Intro \IntroP \\ \IntroB >> 
    >> }
    \score { 
      <<
        \new ChordNames { \harmonies }
        \new Staff << \Rythme \\ \theNotes >> 
      >>
      \layout { indent = 0 }
    }
    \score {
      <<
        \new ChordNames { \EndH }
        \new Staff << \EndP \\ \EndB >> 
      >>
      \layout { indent = 0 }
    }
    \score {
      <<
        \new ChordNames { \CodaH }
        \new Staff << \CodaP \\ \CodaB >> 
      >>
      \layout { indent = 0 }
} } } 

% partition pour instrument en Bb format tablette
\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \header { meter = \markup \with-color #red "Partition sur 2 pages" }
  #(define output-suffix "BbTab") 
  \bookpart {
    \score { 
      <<
        \new ChordNames { \transpose c d  \IntroH }
        \new Staff \with { instrumentName = \Bb } 
        << \Intro \transpose c d \IntroP \\ \transpose c d \IntroB >> 
      >> 
    }
    \score { 
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff << \Rythme \\ \transpose c d \theNotes >> 
      >>
      \layout { indent = 0 }
    }
    \score {
      <<
        \new ChordNames { \transpose c d \EndH }
        \new Staff << \transpose c d \EndP \\ \transpose c d \EndB >> 
      >>
      \layout { indent = 0 }
    }
    \score {
      <<
        \new ChordNames { \transpose c d \CodaH }
        \new Staff << \transpose c d \CodaP \\ \transpose c d \CodaB >> 
      >>
      \layout { indent = 0 }
} } } 

% partition pour instrument en Eb format tablette
\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \header { meter = \markup \with-color #red "Partition sur 2 pages" }
  #(define output-suffix "EbTab")
  \bookpart {
    \score { 
      <<
        \new ChordNames { \transpose c a  \IntroH }
        \new Staff \with { instrumentName = \Eb }  
        << \Intro \transpose c a \IntroP \\ \transpose c d \IntroB >> 
      >> 
    }
    \score { 
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff << \Rythme \\ \transpose c a, \theNotes >> 
      >>
      \layout { indent = 0 }
    }
    \score {
      <<
        \new ChordNames { \transpose c a \EndH }
        \new Staff << \transpose c a \EndP \\ \transpose c a \EndB >> 
      >>
      \layout { indent = 0 }
    }
    \score {
      <<
        \new ChordNames { \transpose c a \CodaH }
        \new Staff << \transpose c a \CodaP \\ \transpose c a \CodaB >> 
      >>
      \layout { indent = 0 }
} } } 

% partition pour instrument en do format a4
\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score { 
      <<
        \new ChordNames { \IntroH }
        \new Staff \with { instrumentName = \CleSol } 
        << \Intro \IntroP \\ \IntroB >> 
      >>
    }
    \score { 
      <<
        \new ChordNames { \harmonies }
        \new Staff << \Rythme \\ \theNotes >> 
      >>
      \layout { indent = 0 }
    }
    \score {
      <<
        \new ChordNames { \EndH }
        \new Staff << \EndP \\ \EndB >>
      >>
      \layout { indent = 0 }
    }
    \score {
      <<
        \new ChordNames { \CodaH }
        \new Staff << \CodaP \\ \CodaB >> 
      >>
      \layout { indent = 0 }
        } } \bookpart {
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

% partition pour instrument en Bb format a4
\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score { 
      <<
        \new ChordNames { \transpose c d  \IntroH }
        \new Staff \with { instrumentName = \Bb }  
        << \Intro \transpose c d \IntroP \\ \transpose c d \IntroB >> 
      >> 
    }
    \score { 
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff << \Rythme \\ \transpose c d \theNotes >> 
      >>
      \layout { indent = 0 }
    }
    \score {
      <<
        \new ChordNames { \transpose c d \EndH }
        \new Staff << \transpose c d \EndP \\ \transpose c d \EndB >> 
      >>
      \layout { indent = 0 }
    }
    \score {
      <<
        \new ChordNames { \transpose c d \CodaH }
        \new Staff << \transpose c d \CodaP \\ \transpose c d \CodaB >> 
      >>
      \layout { indent = 0 }
} } } 

% partition pour instrument en Eb format a4
\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score { 
      <<
        \new ChordNames { \transpose c a  \IntroH }
        \new Staff \with { instrumentName = \Eb }  
        << \Intro \transpose c a \IntroP \\ \transpose c d \IntroB >> 
      >> 
    }
    \score { 
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff << \Rythme \\ \transpose c a, \theNotes >> 
      >>
      \layout { indent = 0 }
    }
    \score {
      <<
        \new ChordNames { \transpose c a \EndH }
        \new Staff << \transpose c a \EndP \\ \transpose c a \EndB >> 
      >>
      \layout { indent = 0 }
    }
    \score {
      <<
        \new ChordNames { \transpose c a \CodaH }
        \new Staff << \transpose c a \CodaP \\ \transpose c a \CodaB >> 
      >>
      \layout { indent = 0 }
} } } 

% partition pour instrument en Bb format tablette
\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab1p") 
  \bookpart {
    \score { 
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff << { { \transpose c d \theNotes } { R1*4 } } >>
      >>

} 
\markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Interlude et coda rhytmique" } }
}
} } 