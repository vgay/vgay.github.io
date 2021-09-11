\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"

#(set! paper-alist (cons '("tablette" . (cons (* 25.41 cm) (* 15.73 cm))) paper-alist))


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

title = #"This Masquerade"
composer = #"Leon Russel"
meter = #"(Slow Latin Rock)"
kwtempo = #"Mod. Slow"
kwstyle = #"Latin Rock"


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
  asplayed = #"George Benson" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=sgl1hQmjITY"
  arranger = \markup \on-the-fly #played?
    \with-url #url
    \with-color #blue \underline
    \concat { "(as sung by " \fromproperty #'header:asplayed ")" }
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
}
}


harmonies = \chordmode {
  f1:m7 bes:13
  f:m f:m7+ f:m7 bes:13
  f:m7 des:9 g:m11 c:5+7.9-11+
  f:m f:m7+ f:m7 bes:13
  des:7 c:5+7 f1.:m7 e4:m7 a:7
  es1:m7 as:9-13 des1*2:7+
  es1:m7 as:9-13 des1*2:7+
  d1:m7 g2:13 g:5+7 c1*2:7+
  g1:m7 g2:13 g:5+7 c1.:9sus4 ges2:11+13
  c1:5+7 f1:m7 bes:13 f:m7 bes:13
}


theNotes =  \relative c'
{
  \clef "treble" \key as \major \time 4/4
\Intro
 \showStartRepeatBar \bar "[|:"

 \comp 8 \bar ":|]"
\A \break
r4 f8 g as bes4 c8 ~ | c g'4 f8 ~ f4 c8 bes | as4. bes8 c4 as8 f ~ | f2 r |
r4. \parenthesize as8 as g as es' ~ | es2. es8 c ~ | c2 r | R1 \break
r8 \parenthesize c, f g as bes4 c8 ~ | c g'4 f8 ~ f ces4 bes8 | as4 bes8 c? ~ c as4 f8 ~ | f2 r4 c8 f ~ |
f2 r8 as bes ces( ~ | \toCoda ces bes ~ bes2) as8 f ~ | f1 | R
\B \break
r4 des'8 es f4 ges8 f ~ | f4 es8 des ~ des4 es8 f ~ | f as,( f) as ~ as2 | R1
r8 as des es f4 ges8 f ~ | f es4. des4 as'8 as( | f1) | r2 r4. f8 | \break
d4 e8 f ~ f4 g8 as~ | as g4. r8 g f g ~ | g4 g,8 g ~ g g( e) g ~ | g2 r4 g8 bes ~
bes2 r4 g8 b ~ | b2 r4 g8 c ~ | c4 d8 bes ~ bes4 c8 g ~ | g4 r2. 
\break
\DSalCoda \bar "|."
ces8 \repeatTie bes ~ bes2 as8 f' ~ | f1 \repeatTie R \bar ".|:" 
\once \override Score.RehearsalMark #'self-alignment-X = #LEFT 
\mark \markup \bold \with-color #red "Solo on vamp or ABA"
\improvisationOn  b,4 b b b | b4 b b b \improvisationOff \bar ":|."
\bar ".."
}


grille = \chordmode {
   \set chordChanges = ##f
\bar "[|:" f1:m7 bes:13 f1:m7 bes:13 \bar ":|]" \break
f:m f:m7+ f:m7 bes:13 \break
f:m7 des:9 g:m11 c:5+7.9-11+ \break
f:m f:m7+ f:m7 bes:13 \break
\Coda des:7 c:5+7 f:m7 \/ e2:m7 a:7 \startStaff \break
es1:m7 as:9-13 \repeat percent 2 des:7+ \break
es1:m7 as:9-13 \repeat percent 2 des:7+ \break
d:m7 \/ g2:13 g:5+7 \startStaff \repeat percent 2 c1:7+ \break
g:m7 \/ g2:13 g:5+7 \startStaff c1:9sus4 \/ c2:9sus4 ges:11+13 \startStaff \break
\Coda des1:7 c:5+7 f:m7 bes:13 \break
\bar "[|:" f1:m7 bes:13 f1:m7 bes:13 \bar ":|]" \break

}

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 Intro s1*3
  s1 ^\markup \bold \box \fontsize #7 A s1*15
  s1 ^\markup \bold \box \fontsize #7 B s1*15
  s1 s1*3
  s1 ^\markup \larger "Solo Vamp or ABA"
}

verse = \lyricmode {
  Are we real -- ly hap -- py here with this lon' -- ly game we play? __ "  "
Loo -- king for words to say __
"  " Sear -- ching but not fin -- ding un -- der -- stan -- ding a -- ny -- where
We're lost in a mas -- quer -- ade __

Both a -- fraid to say we're just too far a -- way __
From be -- ing close to -- ge -- ther from the start __
We tried to talk it o -- ver but the words got in the way __
We're lost in -- side this lon' -- ly game we play __


% 
% [​​Bridge]​​
% 

}

verseB = \lyricmode {
  
  Thoughts of lea -- ving dis -- ap -- pear ev' -- ry time I see your eyes __
No mat -- ter how hard I try __
To un -- der -- stand the rea -- sons why we car -- ry on this way
We're lost in a mas -- quer -- ade __

  
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
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c a, \theNotes
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
          \\ { s1*6 \break s1*8 \break s1*8 \break s1*8 \break }
      >> >>
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
          \addlyrics \verse
          \addlyrics \verseB
          \\ { s1*6 \break s1*8 \break s1*8 \break s1*8 \break }
      >> >>

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
            \new Voice = "PartPOneVoiceOne" { \transpose c a, \theNotes }
          \addlyrics \verse
          \addlyrics \verseB
          \\ { s1*6 \break s1*8 \break s1*8 \break s1*8 \break }
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