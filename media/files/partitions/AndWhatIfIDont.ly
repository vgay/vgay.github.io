\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



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
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 0))
  oddHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \null \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} }
  } }
  evenHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} \null }
    }
  }
}

title = #"And What If I Don't"
composer = #"Herbie Hancock"
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
  asplayed = #"Herbie Hancock" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=0S6CBq1tdrY"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
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
    \override MultiMeasureRest #'expand-limit = #2
  }
  \context {
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
    \RemoveAllEmptyStaves
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
}


form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  s1*3 es4:7 r2.
  es2:7 bes:7 es1:7 c:m s bes4:7 es2:7 a8:7 as:7 s1 f2.:7 b8:7 bes:7 r1 f4:7 bes:7 es2:7 r1
  g1*2:7 c:7 g:7 f:7 es2:7 bes:7 es1:7 c:m s bes4:7 es2:7 a8:7 as:7 s1 f4:7 bes:7 es2:7 r1
}


theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4 \Intro   \override Rest #'staff-position = #0
  <<
    \tag piano \relative c' { \repeat unfold 3 { r4 <g des'> r8 <as d> r4 } | <g des'>-> }
    \tag vents  \relative c' { \override Staff.MultiMeasureRest.space-increment = 40 \inlineMMRN R1*3 r4 }
  >>

  c8 es~ \tuplet 3/2 { es f c } es g~ \bar "||-[|:" \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup {  \box A \raise #1 \with-color #red \bold \larger \musicglyph "scripts.varsegno" }
  \repeat volta 2 {
    g4 r r2 | r4 c,8 es~ \tuplet 3/2 { es f c } es c~ | c4  r r2 | r4 c8 es~ \tuplet 3/2 { es f c } es4-. \break
    bes'8 es~ es2 a,8 as~ | as2 r8 es ges as
  }
  \alternative {
    { as4 ges8 bes r2 | r4 c,8 es~ \tuplet 3/2 { es f c } es g \laissezVibrer}
    { as8 ges es d es4-.  r4 | r2_\markup "piano fills" r8 g g4 }
  }
  \break \mark #2 \bar "||" e'4 bes16 b bes e, g2 | r2 r8 g g4 |  e'4 bes16 b bes e, g2 | r2 r8 f8 f4 \break
  d'4 as16 a as d, f2 | r2 r8 f f4 |  d'4 as16 a as d, f2 | r4 c8 es~ \tuplet 3/2 { es f c } es g~
  \break \bar "||" \mark #1
  g4 r r2 | r4 c,8 es~ \tuplet 3/2 { es f c } es c~ | c4  r r2 | r4 c8 es~ \tuplet 3/2 { es f c } es4-. \break
  bes'8 es~ es2 a,8 as~ | as2 r8 es ges as | as8 ges es d es4-.  r4 |
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \once \override Score.RehearsalMark #'direction = #DOWN
  \mark \markup "   Solo Break"
  R1
  \bar ".."
  \label #'theLastPage
}

theNotesII =  \relative c'' {
  \clef "treble" \key es \major \time 4/4
  \set Staff.ottavationMarkups = #ottavation-ordinals
  s1*8 \ottava #-1
  <<
    { as8 ges~ ges2 des8 ces~ | ces2 r8 bes des es | es4 des8 d }
    \\
    { d8 des~ des2 g,8 ges~ | ges2 r8 g bes c | c4 bes8 d }
  >>
  r2
  r4 c8 es~ \tuplet 3/2 { es f c } es g \laissezVibrer
  <<
    { es8 des c bes bes4 } \\ { c8 bes as g g4 }
  >> \ottava #0 r4 | r2 r8 g'8 4
  s1*12 \ottava #-1
  <<
    { as8 ges~ ges2 des8 ces~ | ces2 r8 bes des es | es8 des c bes bes4  }
    \\
    { d8 des~ des2 g,8 ges~ | ges2 r8 g bes c | c8 bes as g g4 }
  >> \ottava #0 r4 R1
}

theNotesIII =  \relative c'' {
  \clef "treble" \key es \major \time 4/4
  \set Staff.ottavationMarkups = #ottavation-ordinals
  s1*8
  <<
    { as8 ges~ ges2 des8 ces~ | ces2 r8 bes des es | es4 des8 d }
    \\
    { d8 des~ des2 g,8 ges~ | ges2 r8 g bes c | c4 bes8 d }
  >>
  r2
  r4 c8 es~ \tuplet 3/2 { es f c } es g \laissezVibrer
  <<
    { es8 des c bes bes4 } \\ { c8 bes as g g4 }
  >>  r4 | r2 r8 g'8 4
  s1*12
  <<
    { as8 ges~ ges2 des8 ces~ | ces2 r8 bes des es | es8 des c bes bes4  }
    \\
    { d8 des~ des2 g,8 ges~ | ges2 r8 g bes c | c8 bes as g g4 }
  >>  r4 R1
}

chordsRhythm = \relative c''' {
  \voiceOne
  \improvisationOn \override NoteHead.no-ledgers = ##t
  s1*10 s2. b8 b-> | s1 s2. b8 b-> s1 | s2. 4 | 8 4 8 s2 | s2. 4 | 8 4 8 s2 | s2. 4 | 8 4 8 s2 | s2. 8 8->
  s1*7 s2. 8 8->


}

Basse = \relative c, {
  \clef "bass" \key es \major \time 4/4
  \repeat unfold 3 { es4 r bes' \acciaccatura a8 bes4  } es,4-> r4 r2

  \bar ".."
}

grille = \chordmode {
  \mark #1 \bar "[|:" es2:7 bes:7 es1:7 \repeat percent 2 { c:m } \break
  es:7 as:7 \set Score.repeatCommands = #'((volta "1.") ) f:m f:m/bes
  \set Score.repeatCommands = #'((volta #f) end-repeat) \break
  \stopStaff s1 \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2.") )
  f2:m bes:7 es1:7 \set Score.repeatCommands = #'((volta #f)) \bar "||" \break \mark #2
  \repeat percent 2 { g:7 } \repeat percent 2 { c:7 } \break
  \repeat percent 2 { f:7 } \repeat percent 2 { bes:7 } \break \bar "||" \mark #1
  es2:7 bes:7 es1:7 \repeat percent 2 { c:m } \break
  es:7 as:7 f2:m bes:7 es1:7

  \bar ".." }



\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol }
          <<
            \new Voice \chordsRhythm
            \new Voice \keepWithTag piano \theNotes
          >>
          \new Staff \theNotesII
          \new Staff \Basse
      >> >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \keepWithTag vents \transpose c d \theNotes
        >>
        \new Staff \transpose c d \theNotesII
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    %print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \keepWithTag vents \transpose c a \theNotes
        >>
        \new Staff \transpose c a \theNotesIII
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##f
    %page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol }
          <<
            \new Voice \chordsRhythm
            \new Voice \keepWithTag piano \theNotes
          >>
          \new Staff \theNotesII
          \new Staff \Basse
      >> >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##f
    %page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \keepWithTag vents \transpose c d \theNotes
        >>
        \new Staff \transpose c d \theNotesII
      >> >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##f
    %page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \keepWithTag vents \transpose c a \theNotes
        >>
        \new Staff \transpose c a \theNotesIII
      >> >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

% \book {
%   \paper {
%     #(set-paper-size "tablette")
%     %page-count = #1
%   }
%   #(define output-suffix "BassTab")
%   %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa } <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
% } }
%
% \book {
%   \paper {
%     #(set-paper-size "a4")
%     %page-count = #1
%   }
%   #(define output-suffix "Bassa4")
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa }
%         <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
%     %}  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         \context {
%           \Score
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%         \context {
%           \ChordGrid
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Percent_repeat_engraver"
%         }
%       }
%       \new ChordGrid \\grille
% } } }

% \book {
%   %\paper { %page-count = #1
%	#(set-paper-size "a4")}
%   \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
%   \bookpart {
%     #(define output-suffix "RSa4")
%     \score {
%       <<
%         \new ChordNames {
%           \set chordChanges = ##f
%           \Accords
%         }
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Piano"
%           \new Voice = "Mel" { \chordsRhythm }
%         >>
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Basse"
%           \new Voice = "Mel" { \clef "bass_8" \Basse }
%           \new Voice = "Ctrl" { \ossature }
%         >>
%       >>
%
%     } %\form
%     %}  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         \context {
%           \Score
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%         \context {
%           \ChordGrid
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Percent_repeat_engraver"
%         }
%       }
%       \new ChordGrid \transpose c a \grille
% } } }

% \book {
%   %\paper { %page-count = #2
%	#(set-paper-size "tablette")}
%   \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
%   \bookpart {
%     #(define output-suffix "RSTab")
%     \score {
%       <<
%         \new ChordNames {
%           \set chordChanges = ##f
%           \Accords
%         }
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Piano"
%           \new Voice = "Mel" { \chordsRhythm }
%         >>
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Basse"
%           \new Voice = "Mel" { \clef "bass_8" \Basse }
%           \new Voice = "Ctrl" { \ossature }
%         >>
%       >>
%
% } } }