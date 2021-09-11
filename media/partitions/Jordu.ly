
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

title = #"Jordu"
composer = #"Duke Jordan"
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
  asplayed = #"Clifford Brown" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
    \with-url #url
    \with-color #blue \underline
    \concat { "(as played by " \fromproperty #'header:asplayed ")" }  tagline = ##f
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
  }
  \context {
    \consists "Pitch_squash_engraver"
  }
}


harmonies = \chordmode {
  s1 d2:7 g:7 c1:m6 f2:7 bes:7 es1:7+
  d2:7 g:7 c1:m6 as1*2:7 as1:7
  g2:7 c:7 f:7 bes:7 es:7 as:7 des1:6
  f2:7 bes:7 es:7 as:7 des:7 ges:7 b1:7+ as:7
  as2:7 g:7 c f:7 bes:7 es:7 as:7 des d2..:7 g8:5-7 r2.. b8/c
}

hrythmique = \chordmode {
  s1 s8 d4.:7 g:7 c8:m6 s1
  f2:7 bes4.:7 es8:7+ s1
  s8 d4.:7 g:7 c8:m6 s1 as:7 s1
  as2..:7 g8:7
  g2:7 c:7 f:7 bes:7 es:7 as:7 des2..:6 f8:7
  f2:7 bes:7 es:7 as:7 cis:7 fis:7 b1:6 as:7
  as2:7 g:7 c f:7 bes:7 es:7 as:7 des d2..:7 g8:5-7 r2.. b8/c
}
theNotes =  \relative c'' {
  \clef "treble" \key es \major \time 4/4
  r8 g c d es f g es
  \repeat volta 3 {
    \A
    <a, fis'>2 <b f'>4. <c es>8 |
    r8 g c d es f g bes |
    < c, a'>2 <d as'>4. <es g>8 |
    r8 g, c d es f g es | \break
    <a, fis'>2 <b f'>4. <c es>8 |
    r2 \tuplet 3/2 { <bes es>16 <c f> <bes es> } <g c>8 <bes es> <ges c>~ |
    \toCoda <ges c>1
  }
  \alternative {
    { r8 g! c d es f g es }
    { r2 r8 g-^ r g->~
      
      \bar "||" \break
      \B
      \set Score.repeatCommands = #'((volta #f))
      g4 b,8\prall a bes4 g'8 e |
      f4 a,8 \prall g as4 f'8 d |
      es4 g,8 \prall f ges4. e8 |
      f2 r8 f'8-^ r f->~ | \break
      f4 a,8 \prall g as4 f'8 d |
      es4 g,8 \prall f ges4 es'8 c |
      des4 f,8 \prall es e4. d8 |
      es!-. g c d es f g es }
    { R1 }
  }
  \bar "|." \break
  \Coda
  << 
    { c1 \repeatTie | c2 \tuplet 3/2 { es4 c es } |
      c1 | r2 es8 c es c~
      c1 | r4. g8 \tuplet 3/2 { bes16 c bes } g8 bes b~ |
      b1 \fermata }
    \\
    { ges2 \repeatTie f | e a | as g | ges f | fis2.. f8 |
      r4. g8 \tuplet 3/2 { bes16 c bes } g8 bes fis~ | fis1 }
  >>
  \bar ".."
}


Rythmique =  \relative c'' {
  \clef "treble" \key es \major \time 4/4
  \mark \markup { \column {  \pad-markup #4 " "  \bold "Rythmique pendant le thème"  } }
  R1 \improvisationOn
  \repeat volta 3 {
    \A
    r8 bes r4 bes4.  bes8 
    << { \override MultiMeasureRest.staff-position = #2 R1 } \\ { \override TextSpanner.bound-details.left.text = "break" s16 \startTextSpan s2.. s16 \stopTextSpan }  >>
    r8 bes r4 bes4.  bes8 | << { \override MultiMeasureRest.staff-position = #2 R1} \\ { \override TextSpanner.bound-details.left.text = "break" s16 \startTextSpan s2.. s16 \stopTextSpan }  >> | \break
    r8 bes r4 bes4. \improvisationOff <as, as' c>8~ |
    <as as' c>4 <bes bes' d> <c c' es> <es es' g> |
    \improvisationOn \toCoda
    \comp #3 bes'8 bes }
  \alternative {
    { << { \override MultiMeasureRest.staff-position = #2 R1 } \\ { \override TextSpanner.bound-details.left.text = "break" s16 \startTextSpan s2.. s16 \stopTextSpan }  >> }
    { bes4-. \override TextSpanner.bound-details.left.text = "dr. fill" r  \startTextSpan r4. bes8~ \stopTextSpan
      \bar "||" \break \B \set Score.repeatCommands = #'((volta #f))
      \once \override Voice.Stem.transparent = ##t
      bes4 \comp #14 bes8 bes~ \break
      \once \override Voice.Stem.transparent = ##t
      bes4 \comp #11 
      << { \improvisationOn \stemDown bes4-. b2.\rest } \\ { \override TextSpanner.bound-details.left.text = "break" s8 s8 \startTextSpan s2 s4 \stopTextSpan }  >> }
    {  << { \improvisationOn \stemDown bes4-. b2.\rest } \\ { \override TextSpanner.bound-details.left.text = "dr. fill" s8 s8 \startTextSpan s2 s4 \stopTextSpan }  >> }
  }
  \bar "|." \break \Coda \comp #19 bes8 bes r2.. bes8~ bes1 \fermata \bar ".."
}

grille = \chordmode {
  \bar "[|:"
  \/ d2:7 g:7 \startStaff c1:m6 \/ f2:7 bes:7 \startStaff es1:7+ \break 
  \/ d2:7 g:7 \startStaff c1:m6 
  \repeat percent 2 as:7 \bar ":|]" \break
  \/ g2:7 c:7 \/ f:7 bes:7 \/ es:7 as:7 \startStaff des1:6 \break
  \/ f2:7 bes:7 \/ es:7 as:7 \/ cis:7 fis:7 \startStaff b1:6 \bar "||" \break
  \/ d2:7 g:7 \startStaff c1:m6 \/ f2:7 bes:7 \startStaff es1:7+ \break 
  \/ d2:7 g:7 \startStaff c1:m6 
  \tweak X-offset #0
  \tweak Y-offset #2
  \mark \markup  { \with-color #red \fontsize #0 \musicglyph "scripts.varcoda" }  
  \repeat percent 2 as:7 \bar "|." \break
  \tweak X-offset #0
  \tweak Y-offset #2
  \mark \markup  { \with-color #red \fontsize #0 \musicglyph "scripts.varcoda" }  
  \/ as2:7 g:7 \/ c f:7 \/ bes:7 es:7 \/ as:7 des \break
  \/ d:7 g:5-7 \startStaff r1 b/c
 
  \bar ".." }


marques = \relative c' { 
  s1  ^\markup \bold \box \fontsize #7 A s1*7 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
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
        \new Staff \with { instrumentName = \CleSol  \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \theNotes
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
        \new Staff \with { instrumentName = \Bb  \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \transpose c d \theNotes
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
        \new Staff \with { instrumentName = \Eb  \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \transpose c a, \theNotes
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
        \new Staff \with { instrumentName = \CleSol  \consists "Merge_rests_engraver" } 
        <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \theNotes
      >> >>
    } 
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \hrythmique
        }      
        \new Staff <<
          \Rythmique
        >>
      >>
      \layout {
        indent = 0
    } } 
  }
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
        \new Staff \with { instrumentName = \Bb  \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
      >> >>
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
        \new Staff \with { instrumentName = \Eb  \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \transpose c a, \theNotes
      >> >>
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